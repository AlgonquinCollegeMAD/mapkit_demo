import MapKit
import SwiftUI

struct BasicMapView: View {
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 45.424721, longitude: -75.695000),
    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
  )
  
  let locations = [
    Location(name: "Parliament Hill", coordinate: CLLocationCoordinate2D(latitude: 45.4236, longitude: -75.7009)),
    Location(name: "Canadian Museum of History", coordinate: CLLocationCoordinate2D(latitude: 45.4296, longitude: -75.7103)),
    Location(name: "Rideau Canal", coordinate: CLLocationCoordinate2D(latitude: 45.4215, longitude: -75.6972)),
    Location(name: "ByWard Market", coordinate: CLLocationCoordinate2D(latitude: 45.4275, longitude: -75.6924)),
    Location(name: "National Gallery of Canada", coordinate: CLLocationCoordinate2D(latitude: 45.4294, longitude: -75.6984))
  ]
  
  @State private var selectedLocation: Location?
  
  var body: some View {
    Map(initialPosition: .region(region)) {
      ForEach(locations) { location in
        Annotation(location.name, coordinate: location.coordinate) {
          Button(action: {
            selectedLocation = location
          }) {
            Image(systemName: "star.circle.fill")
              .foregroundColor(.blue)
              .font(.largeTitle)
          }
        }
        .annotationTitles(.hidden)
      }
    }
    .edgesIgnoringSafeArea(.all)
    .alert(item: $selectedLocation) { location in
      Alert(title: Text(location.name), message: Text("You selected \(location.name)."), dismissButton: .default(Text("OK")))
    }
  }
}

#Preview {
  BasicMapView()
}
