# flutter_whatsapp_launch


[![pub package](https://img.shields.io/badge/pub-0.0.1-blue.svg)](https://pub.dartlang.org/packages/flutter_whatsapp_launch)

A Flutter plugin for launching a whatsApp. Supports: iOS, Android

## Usage

To use this plugin, add `flutter_whatsapp_launch` as a [dependency in your pubspec.yaml file](https://flutter.dev/platform-plugins/).

## Installation

### iOS

Add the following entry to your Info.plist file, located in <project root>/ios/Runner/Info.plist:

````xml
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>whatsapp</string>
</array>
````

### Android

n/a

## Example

````dart
import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_launch/flutter_launch.dart';


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
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
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
import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_launch/flutter_launch.dart';


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
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
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


````