//
//  EditView.swift
//  BucketList
//
//  Created by Beto Toro on 18/08/22.
//

import SwiftUI

struct EditView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var viewModel: ViewModel
  var onSave: (Location) -> Void
  
  init(location: Location, onSave: @escaping (Location) -> Void) {
    self.onSave = onSave
    _viewModel = StateObject(wrappedValue: ViewModel(location: location))
  }

  var body: some View {
    NavigationView {
      Form {
        Section {
          TextField("Place name", text: $viewModel.name)
          TextField("Description", text: $viewModel.description)
        }
        Section("Nearby…") {
          switch viewModel.loadingState {
          case .loaded:
            ForEach(viewModel.pages, id: \.pageid) { page in
              Text(page.title)
                .font(.headline)
              + Text(": ") +
              Text(page.description)
                .italic()
            }
          case .loading:
            Text("Loading…")
          case .failed:
            Text("Please try again later.")
          }
        }
      }
      .navigationTitle("Place details")
      .toolbar {
        Button("Save") {
          let newLocation = viewModel.createNewLocation()
          onSave(newLocation)
          dismiss()
        }
      }
      .task {
        await viewModel.fetchNearbyPlaces()
      }
    }
  }
}

struct EditView_Previews: PreviewProvider {
  static var previews: some View {
    EditView(location: Location.example) { _ in }
  }
}
