import Flutter
import UIKit

public class FlutterWhatsappLaunchPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_whatsapp_launch", binaryMessenger: registrar.messenger())
    let instance = FlutterWhatsappLaunchPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "launchWhatsapp":
      let args = call.arguments as! Dictionary<String, String>
      let phone = args["phone"]
      let message = args["message"]

      let urlString = "whatsapp://send?phone=\(phone ?? "0")&text=\(message ?? "0")"

      let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
      let URL = NSURL(string: urlStringEncoded!)

      if UIApplication.shared.canOpenURL(URL! as URL) {
         UIApplication.shared.openURL(URL! as URL)
      }
    case "hasApp":
       let args = call.arguments as! Dictionary<String, String>
       let name = args["name"]

        switch name ?? "0" {
           case "whatsapp":
             result(schemeAvailable(scheme: "whatsapp://send"))
             break
           default:
             result(false)
             break
        }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
