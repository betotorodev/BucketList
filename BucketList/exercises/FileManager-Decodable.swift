//
//  FileManager-Decodable.swift
//  BucketList
//
//  Created by Beto Toro on 16/08/22.
//

import Foundation

extension FileManager {
  static var documentsDirectory: URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  func load(_ str: String) -> String {
    let path = self.urls(for: .documentDirectory, in: .userDomainMask)
    
    let url = path[0].appendingPathComponent("message.txt")
    
    do {
      try str.write(to: url, atomically: true, encoding: .utf8)
      let input = try String(contentsOf: url)
      return input
    } catch {
      print(error.localizedDescription)
    }
    return "fail to load"
  }
}
