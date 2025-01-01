//
//  MusicKitPluginMethodKeys.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/25.
//

import Foundation

extension MusicKitPlugin {
  enum MethodKeys: String {
    case authorizationStatus
    case requestAuthorizationStatus
    //
    case requestDeveloperToken
    case requestUserToken
    //
    case currentCountryCode
    // player
    case isPreparedToPlay
    case playbackTime
    case musicPlayerState
    case pause
    case play
    case prepareToPlay
    case restartCurrentEntry
    case skipToNextEntry
    case skipToPreviousEntry
    case stop
    case setQueue
    case setQueueWithItems
    case repeatMode
    case setRepeatMode
    case toggleRepeatMode
    case shuffleMode
    case setShuffleMode
    case toggleShuffleMode
  }
}
