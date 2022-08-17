//
//  FaceIdView.swift
//  BucketList
//
//  Created by Beto Toro on 17/08/22.
//

import LocalAuthentication
import SwiftUI

struct FaceIdView: View {
  
  @State private var isUnlocked = false
  
  func authenticate() {
    let context = LAContext()
    var error: NSError?
    
    // check whether biometric authentication is possible
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
      // it's possible, so go ahead and use it
      let reason = "We need to unlock your data."
      
      context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
        // authentication has now completed
        if success {
          // authenticated successfully
          isUnlocked = true
        } else {
          // there was a problem
        }
      }
    } else {
      // no biometrics
    }
  }
  var body: some View {
    VStack {
      if isUnlocked {
        Text("Unlocked")
      } else {
        Text("Locked")
      }
    }
    .onAppear(perform: authenticate)
  }
}

struct FaceIdView_Previews: PreviewProvider {
  static var previews: some View {
    FaceIdView()
  }
}
