# Music Kit
<?code-excerpt path-base="example/lib"?>

[![pub package](https://img.shields.io/pub/v/music_kit.svg)](https://pub.dev/packages/music_kit)

A Flutter plugin to access and play Apple Music. Supports Android, iOS and macOS.
Not all methods are supported on all platforms.

|             | Android | iOS   | macOS |
|-------------|---------|-------|-------|
| **Support** | SDK 21+ | 15.0+ | 14.0+ |


## Usage

To use this plugin, add `music_kit` as a dependency in your pubspec.yaml file.

### Extra steps needs for Android

1. Add the JitPack repository to your build file.

```
repositories {
  ...
  maven { url 'https://jitpack.io' }
}
```

2. Call `initialize(developerToken, musicUserToken: [userToken])` method manually
   before using the MusicKit instance.

### Example

```dart
// Import package
import 'package:music_kit/music_kit.dart';

// Instantiate it
var musicKit = MusicKit();

// Set Queue
await musicKit.setQueue(item.type, item: item.toJson())

// Play
await musicKit.play();

// Be informed when the player state changes
musicKit.onMusicPlayerStateChanged.listen((MusicPlayerState state) {
  // Do something with new state
});
```
