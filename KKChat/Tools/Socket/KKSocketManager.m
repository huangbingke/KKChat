//
//  KKSocketManager.m
//  KKChat
//
//  Created by KK on 2021/1/15.
//

#import "KKSocketManager.h"
#import <SocketRocket.h>

@interface KKSocketManager ()<SRWebSocketDelegate>
@property (nonatomic, strong) SRWebSocket *webSocket;
@property (nonatomic, assign) KKSocketStatus socketStatus;

@property(nonatomic, weak) NSTimer *timer;
@property(nonatomic, strong) NSTimer *pingTimer;  //每10秒钟发送一次ping消息
@property(nonatomic, strong) NSString *urlString;
@property(nonatomic, assign) NSUInteger currentCount;  //当前重连次数

@end
@implementation KKSocketManager

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static KKSocketManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [KKSocketManager new];
        manager.overtime = 3;
        manager.pingTimer = [NSTimer scheduledTimerWithTimeInterval:10 target:manager selector:@selector(sendPingMessage) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:manager.pingTimer forMode:NSRunLoopCommonModes];
    });
    return manager;
}


- (void)connect {
    [self.webSocket close];
    self.webSocket.delegate = nil;
    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://127.0.0.1:6969"]]];
    self.webSocket.delegate = self;
    self.socketStatus = KKSocketStatusConnecting;
    [self.webSocket open];
}

- (void)close {
    [self.webSocket close];
    self.webSocket = nil;
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)reconnect {
    if (self.currentCount < self.reconnectCount) {
        //计数器+1
        self.currentCount ++;
        NSLog(@"%lf秒后进行第%zd次重试连接……",self.overtime,self.currentCount);
        // 开启定时器
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.overtime target:self selector:@selector(connect) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        self.timer = timer;
    }
    else{
        NSLog(@"重连次数已用完……");
        if (self.timer) {
            [self.timer invalidate];
            self.timer = nil;
        }
    }
}
- (void)sendPingMessage {
    NSString * request = @"GET / HTTP/1.1\n"
                          "Host: localhost\n\n";
    [self.webSocket sendPing:[NSData dataWithContentsOfURL:[NSURL URLWithString:request]]];
}


#pragma mark - SRWebSocketDelegate -
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSLog(@"message======> %@", message);
}
- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    self.currentCount = 0;
    self.socketStatus = KKSocketStatusConnected;
    NSLog(@"1 did Open");
}
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    
    self.socketStatus = KKSocketStatusFailed;
    //尝试重新连接
    [self reconnect];
    NSLog(@"2 did fail %@", error);
}
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    if(code == SRStatusCodeNormal) {
        self.socketStatus = KKSocketStatusUserClose;
    } else {
        self.socketStatus = KKSocketStatusSystemClose;
        //尝试重新连接
        [self reconnect];
    }
    NSLog(@"3 did Close %ld, %@, %d", code, reason, wasClean);
}
- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    NSLog(@"4 pong Payload:  %@", pongPayload);
}
- (void)webSocket:(SRWebSocket *)webSocket didReceivePingWithData:(nullable NSData *)data {
    
    NSLog(@"收到 Ping");
}
- (BOOL)webSocketShouldConvertTextFrameToString:(SRWebSocket *)webSocket {
    return YES;
}




@end
