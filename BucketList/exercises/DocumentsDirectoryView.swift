//
//  DocumentsDirectoryView.swift
//  BucketList
//
//  Created by Beto Toro on 16/08/22.
//

import SwiftUI

struct DocumentsDirectoryView: View {
//  func getDocumentsDirectory() -> URL {
//    // find all possible documents directories for this user
//    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//    // just send back the first one, which ought to be the only one
//    return paths[0]
//  }
  var body: some View {
    Text("Hello World")
      .onTapGesture {
        let input = FileManager.default.load("test message")
        print(input)
//        let str = "Test Message"
//        let url = getDocumentsDirectory().appendingPathComponent("message.txt")
        
//        do {
//          try str.write(to: url, atomically: true, encoding: .utf8)
//          let input = try String(contentsOf: url)
//          print(input)
//        } catch {
//          print(error.localizedDescription)
//        }
      }
  }
}

struct DocumentsDirectoryView_Previews: PreviewProvider {
  static var previews: some View {
    DocumentsDirectoryView()
  }
}
