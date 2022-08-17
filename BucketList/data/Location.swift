//
//  Location.swift
//  BucketList
//
//  Created by Beto Toro on 17/08/22.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
  let id: UUID
  var name: String
  var description: String
  let latitude: Double
  let longitude: Double
}
