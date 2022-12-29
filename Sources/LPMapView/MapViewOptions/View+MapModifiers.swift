//
//  View+MapModifiers.swift
//  
//
//  Created by Lukas Pistrol on 29.12.22.
//

import SwiftUI
import MapKit

public extension View {

    func mapDisplayRoute(
        _ visibility: MapViewVisibility = .visible,
        tint: Color = .blue,
        width: Double = 5
    ) -> some View {
        self
            .environment(\.mapRouteVisibility, visibility)
            .environment(\.mapRouteTint, UIColor(tint))
            .environment(\.mapRouteWidth, width)
    }

    func mapAnnotations(
        _ visibility: MapViewVisibility = .visible,
        tint: Color = .red,
        calloutEnabled: Bool = false
    ) -> some View {
        self
            .environment(\.mapAnnotationVisibility, visibility)
            .environment(\.mapAnnotationTint, UIColor(tint))
            .environment(\.mapShowCallout, calloutEnabled)
    }

    func mapConfiguration(
        _ configuration: MapViewConfiguration,
        elevationStyle: MKMapConfiguration.ElevationStyle = .flat
    ) -> some View {
        self
            .environment(\.mapConfiguration, configuration)
            .environment(\.mapElevationStyle, elevationStyle)
    }
}
