//
//  MusicKitPluginToken.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/25.
//

import Foundation
import MusicKit

let kErrorRequestUserToken = "ERR_REQUEST_USER_TOKEN"

extension SwiftMusicKitPlugin {
  func developerToken(_ result: @escaping FlutterResult) {
    Task.init {
      do {
        let token = try await DefaultMusicTokenProvider().developerToken(options: MusicTokenRequestOptions.ignoreCache)
        result(token)
      } catch {
        result(nil)
      }
    }
  }
  
  func fetchUserToken(developerToken: String, result: @escaping FlutterResult) {
    Task.init {
      do {
        let token = try await MusicUserTokenProvider().userToken(for: developerToken, options: MusicTokenRequestOptions.ignoreCache)
        result(token)
      } catch {
        result(FlutterError(code: kErrorRequestUserToken, message: error.localizedDescription, details: nil))
      }
    }
  }
}
