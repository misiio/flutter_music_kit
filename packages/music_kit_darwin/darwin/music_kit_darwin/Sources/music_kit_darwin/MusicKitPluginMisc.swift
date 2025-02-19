//
//  MusicKitPluginMisc.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/25.
//

import Foundation
import MusicKit

#if os(iOS)
import Flutter
#else
import FlutterMacOS
#endif

extension MusicKitPlugin {
  func currentCountryCode(_ result: @escaping FlutterResult) {
    Task {
      do {
        let code = try await MusicDataRequest.currentCountryCode
        result(code)
      } catch {
        result("")
      }
    }
  }
}

