# Music Kit


A Flutter plugin to access and play Apple Music.

## Platform Support

| Android | iOS | MacOS | Web | Linux | Windows |
| :-----: | :-: | :---: | :-: | :---: | :----: |
|   ✔️    | ✔️  |  ✗   | ✗  |  ✗   |   ✗   |

## Usage

To use this plugin, add `music_kit` as a dependency in your pubspec.yaml file.

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