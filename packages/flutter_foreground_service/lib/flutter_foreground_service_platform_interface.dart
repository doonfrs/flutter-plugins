import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_foreground_service_method_channel.dart';

abstract class FlutterForegroundServicePlatform extends PlatformInterface {
  /// Constructs a FlutterForegroundServicePlatform.
  FlutterForegroundServicePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterForegroundServicePlatform _instance = MethodChannelFlutterForegroundService();

  /// The default instance of [FlutterForegroundServicePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterForegroundService].
  static FlutterForegroundServicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterForegroundServicePlatform] when
  /// they register themselves.
  static set instance(FlutterForegroundServicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
