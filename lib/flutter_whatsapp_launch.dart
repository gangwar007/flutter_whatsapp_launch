
import 'flutter_whatsapp_launch_platform_interface.dart';

class FlutterWhatsappLaunch {
  Future<String?> getPlatformVersion() {
    return FlutterWhatsappLaunchPlatform.instance.getPlatformVersion();
  }

  Future<bool> hasApp({required String name}){
    return FlutterWhatsappLaunchPlatform.instance.hasApp(name);
  }

  Future<void> launchWhatsapp({required String phone, required String message}){
    return FlutterWhatsappLaunchPlatform.instance.launchWhatsapp(phone, message);
  }
}
