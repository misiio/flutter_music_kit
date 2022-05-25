#import "MusicKitPlugin.h"
#if __has_include(<music_kit/music_kit-Swift.h>)
#import <music_kit/music_kit-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "music_kit-Swift.h"
#endif

@implementation MusicKitPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMusicKitPlugin registerWithRegistrar:registrar];
}
@end
