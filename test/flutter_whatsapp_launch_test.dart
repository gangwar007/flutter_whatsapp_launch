import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_whatsapp_launch/flutter_whatsapp_launch.dart';
import 'package:flutter_whatsapp_launch/flutter_whatsapp_launch_platform_interface.dart';
import 'package:flutter_whatsapp_launch/flutter_whatsapp_launch_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterWhatsappLaunchPlatform
    with MockPlatformInterfaceMixin
    implements FlutterWhatsappLaunchPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> hasApp(String name) {
    // TODO: implement hasApp
    throw UnimplementedError();
  }

  @override
  Future<void> launchWhatsapp(String phone, String message) {
    // TODO: implement launchWhatsapp
    throw UnimplementedError();
  }
}

void main() {
  final FlutterWhatsappLaunchPlatform initialPlatform = FlutterWhatsappLaunchPlatform.instance;

  test('$MethodChannelFlutterWhatsappLaunch is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterWhatsappLaunch>());
  });

  test('getPlatformVersion', () async {
    FlutterWhatsappLaunch flutterWhatsappLaunchPlugin = FlutterWhatsappLaunch();
    MockFlutterWhatsappLaunchPlatform fakePlatform = MockFlutterWhatsappLaunchPlatform();
    FlutterWhatsappLaunchPlatform.instance = fakePlatform;

    expect(await flutterWhatsappLaunchPlugin.getPlatformVersion(), '42');
  });
}
