import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_kit_platform_interface/method_channel/method_channel_music_kit.dart';

void main() {
  // ignore: unused_local_variable
  MethodChannelMusicKit platform = MethodChannelMusicKit();
  const MethodChannel channel = MethodChannel('music_kit');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });
}
