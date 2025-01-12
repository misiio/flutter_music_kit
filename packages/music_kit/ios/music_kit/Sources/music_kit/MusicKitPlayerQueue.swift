//
//  MusicKitPlayerQueue.swift
//  music_kit
//
//  Created by Longjiang Lv on 2022/5/27.
//

import Foundation
import MusicKit
import Combine
import Flutter

extension ApplicationMusicPlayer.Queue: JSONEncodable {
  enum CodingKeys: String, CodingKey {
    case entries
    case currentEntry
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(entries.drop { $0.id.contains("_PLACEHOLDER_TAIL_") }.map { $0 }, forKey: .entries)
    try container.encode(currentEntry, forKey: .currentEntry)
  }
}

extension MusicPlayer.Queue.Entry: Encodable {
  enum CodingKeys: String, CodingKey {
    case artwork
    case id
    case item
    case title
    case subtitle
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(artwork, forKey: .artwork)
    try container.encode(id, forKey: .id)
    try container.encode(item, forKey: .item)
    try container.encode(title, forKey: .title)
    try container.encode(subtitle, forKey: .subtitle)
  }
}

extension MusicKitPlugin {
  class MusicPlayerQueueStreamHandler: MusicKitPluginStreamHandler, FlutterStreamHandler {
    let musicPlayer: ApplicationMusicPlayer
    private var playerTask: Task<(), Never>?
    private var cancellable: AnyCancellable?
    
    init(musicPlayer: ApplicationMusicPlayer) {
      self.musicPlayer = musicPlayer
      super.init()
    }
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
      eventSink = events
      
      cancellable = musicPlayer.queue
        .objectWillChange
        .makeConnectable()
        .autoconnect()
        .sink { [weak self] in
          DispatchQueue.main.async { [weak self] in
            self?.eventSink?(self?.musicPlayer.queue.jsonObject())
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
