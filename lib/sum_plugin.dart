import 'dart:async';

import 'package:flutter/services.dart';

class SumPlugin {
  static const MethodChannel _channel = const MethodChannel('sum_plugin');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<int> get sum async {
    final int value =
        await _channel.invokeMethod("sum", {"num1": 1, "num2": 2});
    return value;
  }
}
