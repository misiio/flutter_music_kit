import MusicKit
import Combine

#if os(iOS)
import Flutter
import UIKit
#else
import FlutterMacOS
import AppKit
#endif

public class MusicKitPlugin: NSObject, FlutterPlugin {
  internal var musicPlayer: ApplicationMusicPlayer = ApplicationMusicPlayer.shared
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    #if os(iOS)
    let messenger = registrar.messenger()
    #else
    let messenger = registrar.messenger
    #endif
    
    let channel = FlutterMethodChannel(name: "plugins.misi.app/music_kit", binaryMessenger: messenger)
    let instance = MusicKitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    let musicSubscriptionEventChannel = FlutterEventChannel(
      name: "plugins.misi.app/music_kit/music_subscription",
      binaryMessenger: messenger,
      codec: FlutterStandardMethodCodec.sharedInstance()
    )
    musicSubscriptionEventChannel.setStreamHandler(MusicSubscriptionStreamHandler())
    
    let musicPlayerStateEventChannel = FlutterEventChannel(
      name: "plugins.misi.app/music_kit/player_state",
      binaryMessenger: messenger
    )
    musicPlayerStateEventChannel.setStreamHandler(MusicPlayerStreamHandler(musicPlayer: instance.musicPlayer))
    
    let musicPlayerQueueEventChannel = FlutterEventChannel(
      name: "plugins.misi.app/music_kit/player_queue",
      binaryMessenger: messenger
    )
    musicPlayerQueueEventChannel.setStreamHandler(MusicPlayerQueueStreamHandler(musicPlayer: instance.musicPlayer))
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let methodKey = MethodKeys(rawValue: call.method) else {
      result(FlutterMethodNotImplemented)
      return
    }
    
    switch methodKey {
    case .initialize:
        result(nil)
        
    case .authorizationStatus:
      authorizationStatus(result)
        
    case .requestAuthorizationStatus:
      requestAuthorizationStatus(result)
      
    case .requestDeveloperToken:
      developerToken(result)
      
    case .requestUserToken:
      let arguments = call.arguments as! JSONObject
      fetchUserToken(developerToken: arguments["developerToken"] as! String, result: result)
      
    case .currentCountryCode:
      currentCountryCode(result)
      
    case .isPreparedToPlay:
      isPreparedToPlay(result)
      
    case .playbackTime:
      playbackTime(result)
      
    case .musicPlayerState:
      musicPlayerState(result)
      
    case .pause:
      pause(result)
      
    case .play:
      play(result)
      
    case .prepareToPlay:
      prepareToPlay(result)
      
    case .restartCurrentEntry:
      restartCurrentEntry(result)
      
    case .skipToNextEntry:
      skipToNextEntry(result)
      
    case .skipToPreviousEntry:
      skipToPreviousEntry(result)
      
    case .stop:
      stop(result)
      
    case .setQueue:
      let arguments = call.arguments as! JSONObject
      setQueue(
        itemType: arguments["type"] as! String,
        itemObject: arguments["item"] as! ResourceObject,
        result: result
      )
      
    case .setQueueWithItems:
      let arguments = call.arguments as! JSONObject
      setQueue(
        itemType: arguments["type"] as! String,
        itemObjects: arguments["items"] as! Array<ResourceObject>,
        startingAt: arguments["startingAt"] as? Int,
        result: result
      )
      
    case .repeatMode:
      repeatMode(result)
      
    case .setRepeatMode:
      setRepeatMode(call.arguments as! Int, result: result)
      
    case .toggleRepeatMode:
      toggleRepeatMode(result)
      
    case .shuffleMode:
      shuffleMode(result)
      
    case .setShuffleMode:
      setShuffleMode(call.arguments as! Int, result: result)
      
    case .toggleShuffleMode:
      toggleShuffleMode(result)
    }
  }
}

extension MusicKitPlugin {
  class MusicKitPluginStreamHandler: NSObject {
    var eventSink: FlutterEventSink? = nil
  }
}

extension FlutterError {
  public convenience init(code: String, message: String?) {
    self.init(code: code, message: message, details: nil)
  }
}

