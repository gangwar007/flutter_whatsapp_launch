import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_whatsapp_launch_platform_interface.dart';

/// An implementation of [FlutterWhatsappLaunchPlatform] that uses method channels.
class MethodChannelFlutterWhatsappLaunch extends FlutterWhatsappLaunchPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_whatsapp_launch');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
   Future<bool> hasApp(String name) async{
    final Map<String, dynamic> params = <String, dynamic>{
      'name': name,
    };
    return await methodChannel.invokeMethod('hasApp', params);
  }


  @override
   Future<void> launchWhatsapp(
     String phone,
     String message,
  )async {
    final Map<String, dynamic> params = <String, dynamic>{
      'phone': phone,
      'message': message
    };
    await methodChannel.invokeMethod('launchWhatsapp', params);

  }
}
