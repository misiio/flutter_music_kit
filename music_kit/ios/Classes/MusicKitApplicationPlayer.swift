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
        result(nil)
      } else {
        result(FlutterError(code: kErrorPlay, message: "The item is not playable."))
      }
    } catch {
      result(FlutterError(code: kErrorPlay, message: error.localizedDescription))
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
  
  func repeatMode(_ result: @escaping FlutterResult) {
    result((musicPlayer.state.repeatMode ?? MusicPlayer.RepeatMode.none).intValue)
  }
  
  func setRepeatMode(_ mode: Int, result: @escaping FlutterResult) {
    musicPlayer.state.repeatMode = MusicPlayer.RepeatMode(mode)
    result(nil)
  }
  
  func toggleRepeatMode(_ result: @escaping FlutterResult) {
    let nextRepeatMode = (musicPlayer.repeatMode.intValue + 2) % 3
    musicPlayer.state.repeatMode = MusicPlayer.RepeatMode(nextRepeatMode)
    result(nextRepeatMode)
  }
  
  func shuffleMode(_ result: @escaping FlutterResult) {
    result((musicPlayer.state.shuffleMode ?? MusicPlayer.ShuffleMode.off).intValue)
  }
  
  func setShuffleMode(_ mode: Int, result: @escaping FlutterResult) {
    musicPlayer.state.shuffleMode = MusicPlayer.ShuffleMode(mode)
    result(nil)
  }
  
  func toggleShuffleMode(_ result: @escaping FlutterResult) {
    let nextShuffleMode = musicPlayer.shuffleMode == MusicPlayer.ShuffleMode.off ? MusicPlayer.ShuffleMode.songs : MusicPlayer.ShuffleMode.off
    musicPlayer.state.shuffleMode = nextShuffleMode
    result(nextShuffleMode.intValue)
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
    // startTime not working
    // https://developer.apple.com/forums/thread/714807
    let entry = MusicPlayer.Queue.Entry(item)
    queue = ApplicationMusicPlayer.Queue([entry])
  }
  
  func setQueue<MusicItemType: PlayableMusicItem>(items: MusicItemCollection<MusicItemType>) {
    setQueue(items: items, startingAt: nil)
  }

  func setQueue<MusicItemType: PlayableMusicItem>(items: MusicItemCollection<MusicItemType>, startingAt: MusicItemType?)  {
    queue = ApplicationMusicPlayer.Queue(for: items, startingAt: startingAt)
  }
}

extension MusicPlayer {
  var repeatMode: RepeatMode {
    return state.repeatMode ?? RepeatMode.none
  }
  
  var shuffleMode: ShuffleMode {
    return state.shuffleMode ?? ShuffleMode.off
  }
}
