import Flutter
import UIKit
import MusicKit
import Combine

public class SwiftMusicKitPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugins.misi.app/music_kit", binaryMessenger: registrar.messenger())
    let instance = SwiftMusicKitPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
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
    }
  }
}
