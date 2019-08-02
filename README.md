# device_proxy

A plugin helps to get device's proxy setting

## How to use

```
import 'package:device_proxy/device_proxy.dart';

ProxyConfig proxyConfig = await DeviceProxy.proxyConfig;

print(proxyConfig.isEnable); // Check whether proxy setting is enabled
print(proxyConfig.proxyUrl); // eg. 127.0.0.1:8888
```