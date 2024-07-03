import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_whatsapp_launch_method_channel.dart';

abstract class FlutterWhatsappLaunchPlatform extends PlatformInterface {
  /// Constructs a FlutterWhatsappLaunchPlatform.
  FlutterWhatsappLaunchPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterWhatsappLaunchPlatform _instance = MethodChannelFlutterWhatsappLaunch();

  /// The default instance of [FlutterWhatsappLaunchPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterWhatsappLaunch].
  static FlutterWhatsappLaunchPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterWhatsappLaunchPlatform] when
  /// they register themselves.
  static set instance(FlutterWhatsappLaunchPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

   Future<bool> hasApp(String name){
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
   Future<void> launchWhatsapp(
     String phone,
     String message,
  ){
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

}
