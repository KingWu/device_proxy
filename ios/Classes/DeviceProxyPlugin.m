#import "DeviceProxyPlugin.h"
#import <device_proxy/device_proxy-Swift.h>

@implementation DeviceProxyPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDeviceProxyPlugin registerWithRegistrar:registrar];
}
@end
