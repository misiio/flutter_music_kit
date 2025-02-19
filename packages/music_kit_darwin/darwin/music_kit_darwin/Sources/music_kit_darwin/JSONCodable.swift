//
//  JSONEncodable.swift
//  music_kit
//
//  Created by Xavier Lyu on 2022/5/25.
//

import Foundation

typealias JSONObject = Dictionary<String, Any>

protocol JSONEncodable: Encodable {
  func jsonObject() -> JSONObject?
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

enum JSONCodableError: Error {
  case invalidJSON
}

func decoded<T: Decodable>(json: Any) throws -> T {
  do {
    let data = try JSONSerialization.data(withJSONObject: json)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return try decoder.decode(T.self, from: data)
  } catch {
    throw JSONCodableError.invalidJSON
  }
}

