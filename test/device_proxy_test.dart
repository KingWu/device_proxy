import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_proxy/device_proxy.dart';

void main() {
  const MethodChannel channel = MethodChannel('device_proxy');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

//  test('getPlatformVersion', () async {
//    expect(await DeviceProxy.platformVersion, '42');
//  });
}
