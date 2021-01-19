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

@end
@implementation KKSocketManager

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static KKSocketManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [KKSocketManager new];
    });
    return manager;
}


- (void)connect {
    [self.webSocket close];
    self.webSocket.delegate = nil;
    self.webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://192.168.30.67:8080"]]];
    self.webSocket.delegate = self;
    self.socketStatus = KKSocketStatusConnecting;
    [self.webSocket open];
}

- (void)close {
    [self.webSocket close];
    self.webSocket = nil;
}

- (void)reconnect {

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
    NSLog(@"1 did Open");
}
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    
    self.socketStatus = KKSocketStatusFailed;
    //尝试重新连接
    [self reconnect];
    NSLog(@"2 did fail %@", error);
}
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
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
