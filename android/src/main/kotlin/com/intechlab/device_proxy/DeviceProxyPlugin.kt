package com.intechlab.device_proxy

import android.content.Context
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import android.app.Activity
import androidx.annotation.NonNull


class DeviceProxyPlugin : FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {

    private var activity: Activity? = null

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getProxySetting" -> {
                result.success("${getProxySetting(this.activity)}")
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        val channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.intechlab/device_proxy")

        channel.setMethodCallHandler(DeviceProxyPlugin())
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onDetachedFromActivity() {
        clearActivityy()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        initActivity(binding.activity)
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    private fun initActivity(activity: Activity) {
        this.activity = activity
    }

    private fun clearActivityy() {
        this.activity = null
    }


    private fun getProxySetting(context: Context?): String? {
        try {
            if (android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.ICE_CREAM_SANDWICH) {
                val proxyAddress = android.net.Proxy.getHost(context)
                if (proxyAddress == null || proxyAddress == "") {
                    return proxyAddress
                }
                val port = android.net.Proxy.getPort(context)
                return "$proxyAddress:$port"
            } else {
                val address = System.getProperty("http.proxyHost") ?: ""
                val port = System.getProperty("http.proxyPort") ?: ""

                if (address.isNotEmpty() && port.isNotEmpty()) {
                    return "$address:$port"
                }
            }
        } catch (ex: Exception) {
            //ignore
        }

        return ""
    }
}
