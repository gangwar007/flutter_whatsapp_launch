import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_launch/flutter_whatsapp_launch.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool err = false;
  String msgErr = '';

  @override
  void initState() {
    super.initState();
  }

  void whatsAppOpen() async {
    bool whatsapp = await FlutterWhatsappLaunch().hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterWhatsappLaunch().launchWhatsapp(
          phone: "+918976534453", message: "Hello, flutter_launch");
    } else {
      setState(() {
        err = false;
        msgErr = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin sample app'),
        ),
        body: Center(
            child: TextButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Whatsapp",
                  ),
                  err ? Text(msgErr) : const Text('')
                ],
              ),
              onPressed: () {
                whatsAppOpen();
              },
            )),
      ),
    );
  }
}
