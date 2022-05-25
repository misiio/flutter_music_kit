//
//  MusicKitPluginMisc.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/25.
//

import Foundation
import MusicKit

extension SwiftMusicKitPlugin {
  func currentCountryCode(_ result: @escaping FlutterResult) {
    Task.init {
      do {
        let code = try await MusicDataRequest.currentCountryCode
        result(code)
      } catch {
        result("")
      }
    }
  }
}
