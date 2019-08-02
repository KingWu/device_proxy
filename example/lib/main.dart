import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_proxy/device_proxy.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ProxyConfig _proxyConfig;
  String error;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      _proxyConfig = await DeviceProxy.proxyConfig;
    } on PlatformException {
      error = 'Failed to get proxy setting.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Proxy Url: ${_showProxyUrl()}\n'),
            ],
          ),
        ),
      ),
    );
  }

  String _showProxyUrl(){
    if(null != error && error.isNotEmpty){
      return error;
    }

    if(null == _proxyConfig){
      return '';
    }

    if(!_proxyConfig.isEnable){
      return 'Unkown';
    }

    return _proxyConfig.proxyUrl;
  }
}
