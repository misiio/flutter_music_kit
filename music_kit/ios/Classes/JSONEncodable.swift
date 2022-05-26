//
//  JSONEncodable.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/25.
//

import Foundation

protocol JSONEncodable: Encodable {
  func jsonObject() -> Dictionary<String, Any>?
}

extension JSONEncodable {
  func jsonObject() -> Dictionary<String, Any>? {
    do {
      let encoder = JSONEncoder()
      encoder.dateEncodingStrategy = .iso8601
      let data = try encoder.encode(self)
      let jsonObject = try JSONSerialization.jsonObject(with: data)
      return jsonObject as? Dictionary<String, Any>
    } catch {
      return nil
    }
  }
}
