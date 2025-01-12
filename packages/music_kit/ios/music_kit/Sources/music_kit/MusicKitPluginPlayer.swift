//
//  MusicKitPluginPlayer.swift
//  music_kit
//
//  Created by Longjiang Lv on 2022/5/26.
//

import Foundation
import MusicKit
import Combine
import Flutter

let kErrorPlay = "ERR_PLAYER_PLAY"
let kErrorPrepareToPlay = "ERR_PLAYER_PREPARE_TO_PLAY"
let kErrorSkipToNext = "ERR_PLAYER_SKIP_TO_NEXT"
let kErrorSkipToPrevious = "ERR_PLAYER_SKIP_TO_PREVIOUS"

extension MusicKitPlugin {
  func isPreparedToPlay(_ result: @escaping FlutterResult) {
    result(musicPlayer.isPreparedToPlay)
  }

  func playbackTime(_ result: @escaping FlutterResult) {
    result(musicPlayer.playbackTime)
  }
  
  func musicPlayerState(_ result: @escaping FlutterResult) {
    result(musicPlayer.state.jsonObject())
  }

  func pause(_ result: @escaping FlutterResult) {
    musicPlayer.pause()
    result(nil)
  }

  func play(_ result: @escaping FlutterResult) {
    Task {
      do {
        try await musicPlayer.play()
        result(nil)
      } catch {
        result(FlutterError(code: kErrorPlay, message: error.localizedDescription))
      }
    }
  }

  func prepareToPlay(_ result: @escaping FlutterResult) {
    Task {
      do {
        try await musicPlayer.prepareToPlay()
        result(nil)
      } catch {
        result(FlutterError(code: kErrorPrepareToPlay, message: error.localizedDescription))
      }
    }
  }

  func restartCurrentEntry(_ result: @escaping FlutterResult) {
    musicPlayer.restartCurrentEntry()
    result(nil)
  }

  func skipToNextEntry(_ result: @escaping FlutterResult) {
    Task {
      do {
        try await musicPlayer.skipToNextEntry()
        result(nil)
      } catch {
        result(FlutterError(code: kErrorSkipToNext, message: error.localizedDescription))
      }
    }
  }

  func skipToPreviousEntry(_ result: @escaping FlutterResult) {
    Task {
      do {
        try await musicPlayer.skipToPreviousEntry()
        result(nil)
      } catch {
        result(FlutterError(code: kErrorSkipToPrevious, message: error.localizedDescription))
      }
    }
  }

  func stop(_ result: @escaping FlutterResult) {
    musicPlayer.stop()
    result(nil)
  }
  
}

enum MusicItemType {
  case album
  case artist
  case curator
  case genre
  case musicVideo
  case playlist
  case radioShow
  case recordLabel
  case song
  case station
  case track
  
  init?(_ value: String) {
    switch value.lowercased() {
    case "albums": self = .album
    case "artists": self = .artist
    case "curators": self = .curator
    case "genres": self = .genre
    case "music-videos": self = .musicVideo
    case "playlists": self = .playlist
    case "radio-shows": self = .radioShow
    case "record-labels": self = .recordLabel
    case "songs": self = .song
    case "stations": self = .station
    case "tracks": self = .track
    default: return nil
    }
  }
}

extension MusicKitPlugin {
  class MusicPlayerStreamHandler: MusicKitPluginStreamHandler, FlutterStreamHandler {
    let musicPlayer: ApplicationMusicPlayer
    private var playerTask: Task<(), Never>?
    private var cancellable: AnyCancellable?
    
    init(musicPlayer: ApplicationMusicPlayer) {
      self.musicPlayer = musicPlayer
      super.init()
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
      eventSink = events
      
      cancellable = musicPlayer.state
        .objectWillChange
        .makeConnectable()
        .autoconnect()
        .sink { [weak self] in
          DispatchQueue.main.async { [weak self] in
            self?.eventSink?(self?.musicPlayer.state.jsonObject())
          }
        }
      
      return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
      eventSink = nil
      playerTask?.cancel()
      playerTask = nil
      cancellable?.cancel()
      cancellable = nil
      return nil
    }
  }
}

extension MusicPlayer.State: JSONEncodable {
  enum CodingKeys: String, CodingKey {
    case playbackRate
    case playbackStatus
    case repeatMode
    case shuffleMode
  }
    
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(playbackRate, forKey: .playbackRate)
    try container.encode(playbackStatus.intValue, forKey: .playbackStatus)
    try container.encode(repeatMode?.intValue, forKey: .repeatMode)
    try container.encode(shuffleMode?.intValue, forKey: .shuffleMode)
  }
}

extension MusicPlayer.PlaybackStatus {
  public var intValue: Int {
    switch self {
    case .stopped: return 0
    case .playing: return 1
    case .paused: return 2
    case .interrupted: return 3
    case .seekingBackward: return 4
    case .seekingForward: return 5
    
    @unknown default:
      return 0
    }
  }
}

extension MusicPlayer.RepeatMode {
  public var intValue: Int {
    switch self {
    case .none: return 0
    case .one: return 1
    case .all: return 2
    @unknown default:
      return 0
    }
  }
  
  init(_ intValue: Int) {
    switch intValue {
    case 0:
      self = .none
    case 1:
      self = .one
    case 2:
      self = .all
    default:
      self = .none
    }
  }
}

extension MusicPlayer.ShuffleMode {
  public var intValue: Int {
    switch self {
    case .off: return 0
    case .songs: return 1
    @unknown default:
      return 0
    }
  }
  
  init(_ intValue: Int) {
    switch intValue {
    case 0:
      self = .off
    case 1:
      self = .songs
    default:
      self = .off
    }
  }
}
