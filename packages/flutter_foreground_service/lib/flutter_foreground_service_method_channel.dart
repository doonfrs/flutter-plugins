import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_foreground_service_platform_interface.dart';

/// An implementation of [FlutterForegroundServicePlatform] that uses method channels.
class MethodChannelFlutterForegroundService extends FlutterForegroundServicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_foreground_service');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
