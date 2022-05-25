import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:music_kit/music_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _musicKitPlugin = MusicKit();
  MusicAuthorizationStatus _status = MusicAuthorizationStatus.notDetermined;
  String? _developerToken = '';
  String _userToken = '';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final status = await _musicKitPlugin.authorizationStatus;
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    final developerToken = await _musicKitPlugin.developerToken;
    final userToken =
        await _musicKitPlugin.fetchUserToken(developerToken ?? "");

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _status = status;
      _developerToken = developerToken;
      _userToken = userToken;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('DeveloperToken: $_developerToken\n'),
              Text('UserToken: $_userToken\n'),
              Text('Status: ${_status.toString()}\n'),
              TextButton(
                  onPressed: () async {
                    final status =
                        await _musicKitPlugin.requestAuthorizationStatus();
                    setState(() {
                      _status = status;
                    });
                  },
                  child: const Text('Request authorization'))
            ],
          ),
        ),
      ),
    );
  }
}
