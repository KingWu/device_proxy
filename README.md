# device_proxy

A plugin helps to get device's proxy setting

## How to use

```
import 'package:device_proxy/device_proxy.dart';

ProxyConfig proxyConfig = await DeviceProxy.proxyConfig;

print(proxyConfig.isEnable); // Check whether proxy setting is enabled
print(proxyConfig.proxyUrl); // eg. 127.0.0.1:8888
```

# Powered By 
- [Plaker Lab 創玩坊](https://plakerlab.com/)
- [Wenjetso 搵著數](https://www.wenjetso.com/zh_HK/)
