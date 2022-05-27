import Flutter
import UIKit
import MusicKit
import Combine

public class SwiftMusicKitPlugin: NSObject, FlutterPlugin {
  internal var musicPlayer: ApplicationMusicPlayer = ApplicationMusicPlayer.shared
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.misi.app/music_kit", binaryMessenger: registrar.messenger())
    let instance = SwiftMusicKitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    let musicSubcriptionEventChannel = FlutterEventChannel(name: "plugins.misi.app/music_kit/music_subscription", binaryMessenger: registrar.messenger())
    musicSubcriptionEventChannel.setStreamHandler(MusicSubscriptionStreamHandler())
    
    let musicPlayerStateEventChannel = FlutterEventChannel(name: "plugins.misi.app/music_kit/player_state", binaryMessenger: registrar.messenger())
    musicPlayerStateEventChannel.setStreamHandler(MusicPlayerStreamHandler(musicPlayer: instance.musicPlayer))
    
    let musicPlayerQueueEventChannel = FlutterEventChannel(name: "plugins.misi.app/music_kit/player_queue", binaryMessenger: registrar.messenger())
    musicPlayerQueueEventChannel.setStreamHandler(MusicPlayerQueueStreamHandler(musicPlayer: instance.musicPlayer))
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let methodKey = MethodKeys(rawValue: call.method) else {
      result(FlutterMethodNotImplemented)
      return
    }
    
    switch methodKey {
    case .authorizationStatus:
      authorizationStatus(result)
      break
        
    case .requestAuthorizationStatus:
      requestAuthorizationStatus(result)
      break
      
    case .developerToken:
      developerToken(result)
      break
      
    case .fetchUserToken:
      fetchUserToken(developerToken: call.arguments as! String, result: result)
      break
      
    case .currentCountryCode:
      currentCountryCode(result)
      break
      
    case .isPreparedToPlay:
      isPreparedToPlay(result)
      break
      
    case .playbackTime:
      playbackTime(result)
      break
      
    case .musicPlayerState:
      musicPlayerState(result)
      break
      
    case .pause:
      pause(result)
      break
      
    case .play:
      play(result)
      break
      
    case .prepareToPlay:
      prepareToPlay(result)
      break
      
    case .restartCurrentEntry:
      restartCurrentEntry(result)
      break
      
    case .skipToNextEntry:
      skipToNextEntry(result)
      break
      
    case .skipToPreviousEntry:
      skipToPreviousEntry(result)
      break
      
    case .stop:
      stop(result)
      break
      
    case .setQueue:
      if let arguments = call.arguments as? JSONObject {
        if let items = arguments["items"] as? Array<JSONObject> {
          setQueue(
            itemType: arguments["kind"] as! String,
            itemObjects: items,
            startingAt: arguments["startingAt"] as? Int,
            result: result
          )
        } else {
          setQueue(
            itemType: arguments["kind"] as! String,
            itemObject: arguments["item"] as! JSONObject,
            result: result
          )
        }
      }
      break
      
    }
  }
}

extension SwiftMusicKitPlugin {
  class MusicKitPluginStreamHandler: NSObject {
    var eventSink: FlutterEventSink? = nil
  }
}

extension FlutterError {
  public convenience init(code: String, message: String?) {
    self.init(code: code, message: message, details: nil)
  }
}
