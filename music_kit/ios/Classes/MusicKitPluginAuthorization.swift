//
//  MusicKitPluginAuthorization.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/25.
//

import Foundation
import MusicKit

extension SwiftMusicKitPlugin {
  func authorizationStatus(_ result: @escaping FlutterResult) {
    result(MusicAuthorization.currentStatus.intValue)
  }
  
  func requestAuthorizationStatus(_ result: @escaping FlutterResult) {
    Task.init {
      let status = await MusicAuthorization.request()
      result(status.intValue)
    }
  }
}

extension MusicAuthorization.Status {
  var intValue: Int {
    switch self {
    case .authorized:
      return 0
    case .denied:
      return 1
    case .notDetermined:
      return 2
    case .restricted:
      return 3
    @unknown default:
      fatalError()
    }
  }
}
