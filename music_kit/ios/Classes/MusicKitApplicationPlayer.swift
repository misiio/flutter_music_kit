//
//  MusicKitApplicationPlayer.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/27.
//

import Foundation
import MusicKit

typealias ResourceObject = JSONObject

extension SwiftMusicKitPlugin {
  func setQueue(itemType: String, itemObject: ResourceObject, result: @escaping FlutterResult) {
    do {
      let playableItem: MusicItem? = try parseMusicItem(itemType, from: itemObject)
      
      if let item = playableItem as? PlayableMusicItem {
        musicPlayer.setQueue(item: item)
      }
      result(nil)
    } catch {
    }
  }
  
  func setQueue(itemType: String, itemObjects: Array<ResourceObject>, startingAt: Int? = nil, result: @escaping FlutterResult) {
    do {
      let itemType = MusicItemType(itemType)

      switch itemType {
      case .album:
        let albums: Array<Album> = try decoded(json: itemObjects)
        musicPlayer.setQueue(items: MusicItemCollection(albums), startingAt: startingAt != nil ? albums[startingAt!] : nil)
        
      case .playlist:
        let playlists: Array<Playlist> = try decoded(json: itemObjects)
        musicPlayer.setQueue(items: MusicItemCollection(playlists), startingAt: startingAt != nil ? playlists[startingAt!] : nil)
        
      case .song, .musicVideo, .track:
        let tracks: Array<Track> = try decoded(json: itemObjects)
        musicPlayer.setQueue(items: MusicItemCollection(tracks), startingAt: startingAt != nil ? tracks[startingAt!] : nil)
        
      case .station:
        let stations: Array<Station> = try decoded(json: itemObjects)
        musicPlayer.setQueue(items: MusicItemCollection(stations), startingAt: startingAt != nil ? stations[startingAt!] : nil)
        
      default:
        break
      }
      
      result(nil)
    } catch {
      //
      result(FlutterError(code: kErrorPlay, message: error.localizedDescription))
    }
  }
  
  func setRepeatMode(_ mode: Int, result: @escaping FlutterResult) {
    musicPlayer.state.repeatMode = MusicPlayer.RepeatMode(mode)
    result(nil)
  }
  
  func setShuffleMode(_ mode: Int, result: @escaping FlutterResult) {
    musicPlayer.state.shuffleMode = MusicPlayer.ShuffleMode(mode)
    result(nil)
  }
}

fileprivate func parseMusicItem(_ itemType: String, from itemObject: ResourceObject) throws -> MusicItem? {
  let itemType = MusicItemType(itemType)

  switch itemType {
  case .album:
    let album: Album = try decoded(json: itemObject)
    return album
  case .playlist:
    let playlist: Playlist = try decoded(json: itemObject)
    return playlist
  case .song:
    let song: Song = try decoded(json: itemObject)
    return song
  case .station:
    let station: Station = try decoded(json: itemObject)
    return station
  case .musicVideo:
    let mv: MusicVideo = try decoded(json: itemObject)
    return mv
  default:
    return nil
  }
}

extension ApplicationMusicPlayer {
  func setQueue(item: PlayableMusicItem) {
    queue = [item]
  }
  
  func setQueue<MusicItemType: PlayableMusicItem>(items: MusicItemCollection<MusicItemType>) {
    setQueue(items: items, startingAt: nil)
  }

  func setQueue<MusicItemType: PlayableMusicItem>(items: MusicItemCollection<MusicItemType>, startingAt: MusicItemType?)  {
    queue = ApplicationMusicPlayer.Queue(for: items, startingAt: startingAt)
  }
}
