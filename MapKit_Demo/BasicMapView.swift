import MapKit
import SwiftUI

struct BasicMapView: View {
  @StateObject private var locationService = LocationService()

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
  
  var body: some View {
    Map(initialPosition: .region(region)) {
      MapCircle(center: locations[0].coordinate, radius: CLLocationDistance(50))
         .foregroundStyle(.red.opacity(0.6))
         .mapOverlayLevel(level: .aboveRoads)

      MapCircle(center: locations[1].coordinate, radius: CLLocationDistance(50))
         .foregroundStyle(.mint.opacity(0.6))
         .mapOverlayLevel(level: .aboveLabels)
      
      MapPolygon(coordinates: [locations[0].coordinate,
                               locations[2].coordinate,
                               locations[3].coordinate,
                               locations[4].coordinate]
      )
      .foregroundStyle(.red.opacity(0.6))
      .mapOverlayLevel(level: .aboveRoads)
      
      MapPolyline(coordinates: [locations[1].coordinate, locations[0].coordinate])
        .stroke(.blue, lineWidth: 5)
    }
  }
}

#Preview {
  BasicMapView()
}
