//
//  ViewsWithEnumView.swift
//  BucketList
//
//  Created by Beto Toro on 17/08/22.
//

import SwiftUI

enum LoadingState {
  case loading, success, failed
}

struct LoadingView: View {
  var body: some View {
    Text("Loading...")
  }
}

struct SuccessView: View {
  var body: some View {
    Text("Success!")
  }
}

struct FailedView: View {
  var body: some View {
    Text("Failed.")
  }
}

struct ViewsWithEnumView: View {
  var loadingState = LoadingState.loading
  var body: some View {
    if loadingState == .loading {
      LoadingView()
    } else if loadingState == .success {
      SuccessView()
    } else if loadingState == .failed {
      FailedView()
    }
  }
}

struct ViewsWithEnumView_Previews: PreviewProvider {
  static var previews: some View {
    ViewsWithEnumView()
  }
}
