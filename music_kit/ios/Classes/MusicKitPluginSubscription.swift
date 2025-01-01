//
//  MusicKitPluginSubscription.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/25.
//

import Foundation
import MusicKit
import Flutter

extension MusicKitPlugin {
  class MusicSubscriptionStreamHandler: MusicKitPluginStreamHandler, FlutterStreamHandler {
    private var updatesTask: Task<(), Never>?
    
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
      eventSink = events
      
      updatesTask = Task {
        for await subscription in MusicSubscription.subscriptionUpdates {
          DispatchQueue.main.async { [eventSink] in
            eventSink?(subscription.jsonObject())
          }
        }
      }
      
      return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
      eventSink = nil
      updatesTask?.cancel()
      updatesTask = nil
      return nil
    }
  }
}

extension MusicSubscription: JSONEncodable {
  enum CodingKeys: String, CodingKey {
    case canBecomeSubscriber
    case canPlayCatalogContent
    case hasCloudLibraryEnabled
  }
    
  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(canBecomeSubscriber, forKey: .canBecomeSubscriber)
    try container.encode(canPlayCatalogContent, forKey: .canPlayCatalogContent)
    try container.encode(hasCloudLibraryEnabled, forKey: .hasCloudLibraryEnabled)
  }
}
