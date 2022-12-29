//
//  View+MapModifiers.swift
//  
//
//  Created by Lukas Pistrol on 29.12.22.
//

import MapKit
import SwiftUI

public extension View {

    /// Setup options for displaying a route between annotations.
    ///
    /// - Parameters:
    ///   - visibility: Whether or not the route will be visible.
    ///   - tint: The tint color of the route track.
    ///   - width: The line width of the route track.
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

    /// Setup options for displaying annotations.
    ///
    /// - Parameters:
    ///   - visibility: Whether or not annotations will be visible.
    ///   - tint: The default tint color of the annotation. This can
    ///   be overridden by setting ``MapViewAnnotation/tint`` on
    ///   ``MapViewAnnotation``.
    ///   - calloutEnabled: Whether or not to show a detail callout
    ///   when an annotation is selected. Note that this will only
    ///   work if the annotation has a title.
    ///   - fitInVisibleRect: Whether or not to automatically adjust
    ///   map zoom to fit all annotations.
    func mapAnnotations(
        _ visibility: MapViewVisibility = .visible,
        tint: Color = .red,
        calloutEnabled: Bool = false,
        fitInVisibleRect: Bool = false
    ) -> some View {
        self
            .environment(\.mapAnnotationVisibility, visibility)
            .environment(\.mapAnnotationTint, UIColor(tint))
            .environment(\.mapShowCallout, calloutEnabled)
            .environment(\.mapFitAnnotations, fitInVisibleRect)
    }

    /// Setup options for the map style.
    ///
    /// - Parameters:
    ///   - configuration: A configuration option defining the map
    ///   style.
    ///   - elevationStyle: Defines how elevation data is handled
    ///   when rendering the map view.
    func mapConfiguration(
        _ configuration: MapViewConfiguration,
        elevationStyle: MKMapConfiguration.ElevationStyle = .flat
    ) -> some View {
        self
            .environment(\.mapConfiguration, configuration)
            .environment(\.mapElevationStyle, elevationStyle)
    }
}
