import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Logging config
void printLog([dynamic data, DateTime? startTime]) {
  if (foundation.kDebugMode) {
    var time = '';
    if (startTime != null) {
      final endTime = DateTime.now().difference(startTime);
      final icon = endTime.inMilliseconds > 2000
          ? '⌛️Slow-'
          : endTime.inMilliseconds > 1000
              ? '⏰Medium-'
              : '⚡️Fast-';
      time = '[$icon${endTime.inMilliseconds}ms]';
    }

    try {
      final now = DateFormat('h:mm:ss-ms').format(DateTime.now());
      debugPrint('ℹ️[${now}ms]$time${data.toString()}');
    } catch (e) {
      debugPrint(data.toString());
    }
  }
}
