import 'dart:async';
import 'package:device_proxy/src/ProxyConfig.dart';
import 'package:flutter/services.dart';


class DeviceProxy {
  static const MethodChannel _channel =
      const MethodChannel('com.intechlab/device_proxy');

  static Future<ProxyConfig?> get proxyConfig async {
    final String? proxyData = await _channel.invokeMethod<String>('getProxySetting');
    if (proxyData == null) return null;
    return ProxyConfig(proxyData);
  }
}
