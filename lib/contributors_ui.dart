
import 'dart:async';

import 'package:flutter/services.dart';

class ContributorsUi {
  static const MethodChannel _channel =
      const MethodChannel('contributors_ui');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}