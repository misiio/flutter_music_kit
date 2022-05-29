import 'package:flutter/material.dart';
import 'dart:async';

import 'package:music_kit/music_kit.dart';
import 'package:music_kit_example/fixture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _musicKitPlugin = MusicKit();
  MusicAuthorizationStatus _status =
      const MusicAuthorizationStatus.notDetermined();
  String? _developerToken = '';
  String _userToken = '';
  String _countryCode = '';

  MusicSubscription _musicSubsciption = MusicSubscription();
  late StreamSubscription<MusicSubscription>
      _musicSubscriptionStreamSubscription;

  MusicPlayerState? _playerState;
  late StreamSubscription<MusicPlayerState> _playerStateStreamSubscription;

  MusicPlayerQueue? _playerQueue;
  late StreamSubscription<MusicPlayerQueue> _playerQueueStreamSubscription;

  @override
  void initState() {
    super.initState();
    initPlatformState();

    _musicSubscriptionStreamSubscription =
        _musicKitPlugin.onSubscriptionUpdated.listen((event) {
      setState(() {
        _musicSubsciption = event;
      });
    });

    _playerStateStreamSubscription =
        _musicKitPlugin.onMusicPlayerStateChanged.listen((event) {
      setState(() {
        _playerState = event;
      });
    });

    _playerQueueStreamSubscription =
        _musicKitPlugin.onPlayerQueueChanged.listen((event) {
      setState(() {
        _playerQueue = event;
      });
    });
  }

  @override
  void dispose() {
    _musicSubscriptionStreamSubscription.cancel();
    _playerStateStreamSubscription.cancel();
    _playerQueueStreamSubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final status = await _musicKitPlugin.authorizationStatus;

    final developerToken = await _musicKitPlugin.developerToken;
    final userToken = await _musicKitPlugin.fetchUserToken(developerToken);

    final countryCode = await _musicKitPlugin.currentCountryCode;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _status = status;
      _developerToken = developerToken;
      _userToken = userToken;
      _countryCode = countryCode;
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
              Text('CountryCode: $_countryCode\n'),
              Text('Subscription: ${_musicSubsciption.toString()}\n'),
              Text('PlayerState: ${_playerState?.playbackStatus.toString()}'),
              Text('PlayerQueue: ${_playerQueue?.currentEntry?.title}'),
              TextButton(
                  onPressed: () async {
                    final status =
                        await _musicKitPlugin.requestAuthorizationStatus();
                    setState(() {
                      _status = status;
                    });
                  },
                  child: const Text('Request authorization')),
              TextButton(
                  onPressed: () async {
                    await _musicKitPlugin.setQueue(albumFolklore['type'],
                        item: albumFolklore);
                    await _musicKitPlugin.play();
                  },
                  child: const Text('Play an Album'))
            ],
          ),
        ),
      ),
    );
  }
}
