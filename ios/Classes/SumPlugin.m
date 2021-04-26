#import "SumPlugin.h"

@implementation SumPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"sum_plugin"
            binaryMessenger:[registrar messenger]];
  SumPlugin* instance = [[SumPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"sum" isEqualToString:call.method]) {
      NSInteger a = [call.arguments[@"num1"] intValue];
      NSInteger b = [call.arguments[@"num2"] intValue];
      result([NSNumber numberWithInt:(a + b)]);
    } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
