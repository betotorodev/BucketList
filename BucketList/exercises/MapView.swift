//
//  MapView.swift
//  BucketList
//
//  Created by Beto Toro on 17/08/22.
//

import MapKit
import SwiftUI

struct LocationExample: Identifiable {
  let id = UUID()
  let name: String
  let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
  
  @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
  let locations = [
    LocationExample(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
    LocationExample(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
  ]
  
  var body: some View {
    
    // with navigation view an link
//    NavigationView {
//      Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
//        MapAnnotation(coordinate: location.coordinate) {
//          NavigationLink {
//            Text(location.name)
//          } label: {
//            Circle()
//              .stroke(.red, lineWidth: 3)
//              .frame(width: 44, height: 44)
//          }
//        }
//      }
//      .navigationTitle("London Explorer")
//    }
    Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
      // just a default marker
      MapMarker(coordinate: location.coordinate)
      
      // with custom marker
//      MapAnnotation(coordinate: location.coordinate) {
//        Circle()
//          .stroke(.red, lineWidth: 3)
//          .frame(width: 44, height: 44)
//      }
      
      // with interaction
//      MapAnnotation(coordinate: location.coordinate) {
//        Circle()
//          .stroke(.red, lineWidth: 3)
//          .frame(width: 44, height: 44)
//          .onTapGesture {
//            print("Tapped on \(location.name)")
//          }
//      }
    }
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
