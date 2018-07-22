//
//  Structs.swift
//  ampplayer
//
//  Created by Aleksi Sitomaniemi on 18/07/2018.
//  Copyright © 2018 boogie. All rights reserved.
//

import Foundation

struct MMD {
  init() {
  }
  
  init(path: String, modId: Int) {
    self.init()
    downloadPath = URL.init(string: path)

    id = modId
    let components = path.components(separatedBy: "/")
    if components.count > 1 {
      composer = components[components.count - 2].removingPercentEncoding
      if let modNameParts = components.last?.components(separatedBy: ".") {
        type = modNameParts.first ?? "MOD"
        name = modNameParts[1...modNameParts.count - 2].joined().removingPercentEncoding
        localPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!.appendingPathComponent(name!).appendingPathExtension(type!)
      }
    }
  }
  
  var id: Int?
  var name: String?
  var type: String?
  var composer: String?
  var size: Int?
  var localPath: URL?
  var downloadPath: URL?
}

extension MMD: Equatable {}
func ==(lhs: MMD, rhs: MMD) -> Bool {
  let eq = lhs.id == rhs.id && lhs.id != nil
  return eq
}
