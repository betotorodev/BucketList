//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Beto Toro on 23/08/22.
//

import LocalAuthentication
import Foundation
import MapKit

extension EditView {
  @MainActor class ViewModel: ObservableObject {
    enum LoadingState {
      case loading, loaded, failed
    }
    @Published private var name: String
    @Published private var description: String
    
    @Published private var loadingState = LoadingState.loading
    @Published private var pages = [Page]()
    
  }
}
