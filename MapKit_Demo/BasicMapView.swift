import MapKit
import SwiftUI

struct BasicMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 45.424721, longitude: -75.695000),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
      Map(initialPosition: .region(region))
    }
}

#Preview {
  BasicMapView()
}
