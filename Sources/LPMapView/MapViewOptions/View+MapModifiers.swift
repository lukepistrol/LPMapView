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
    func mapDisplayRoute(
        _ visibility: MapViewVisibility = .visible
    ) -> some View {
        self
            .environment(\.mapRouteVisibility, visibility)
    }

    /// Setup options for drawing the route line.
    ///
    /// - Note: This modifier will also set the route visibility
    /// to `.visible`
    ///
    /// - Parameter style: The route line style to use.
    func mapRouteStyle(_ style: MapRouteStyle) -> some View {
        self
            .environment(\.mapRouteStyle, style)
            .environment(\.mapRouteVisibility, .visible)
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
    ///   - poiFilter: A filter that includes or excludes point of
    ///   interest categories from a map view, local search, or local
    ///   search completer.
    ///   - selectableFeatures: Describes which selectable features
    ///   the map responds to.
    func mapConfiguration(
        _ configuration: MapViewConfiguration,
        elevationStyle: MKMapConfiguration.ElevationStyle = .flat,
        poiFilter: MKPointOfInterestFilter = .includingAll,
        selectableFeatures: MKMapFeatureOptions = []
    ) -> some View {
        self
            .environment(\.mapConfiguration, configuration)
            .environment(\.mapElevationStyle, elevationStyle)
            .environment(\.mapPOIFilter, poiFilter)
            .environment(\.mapSelectableFeatures, selectableFeatures)
    }

    /// Setup options for enabling/disabling user interaction modes
    /// on the ``MapView``.
    ///
    /// - Parameters:
    ///   - zoom: A Boolean value that determines whether the user may
    ///   use pinch gestures to zoom in and out of the map.
    ///   - scroll: A Boolean value that determines whether the user
    ///   may scroll around the map.
    ///   - pitch: A Boolean value that indicates whether the map uses
    ///   the camera’s pitch information.
    ///   - rotate: A Boolean value that indicates whether the map uses
    ///   the camera’s heading information.
    func mapUserInteraction(
        zoom: Bool = true,
        scroll: Bool = true,
        pitch: Bool = true,
        rotate: Bool = true
    ) -> some View {
        self
            .environment(\.mapInteractionZoom, zoom)
            .environment(\.mapInteractionScroll, scroll)
            .environment(\.mapInteractionPitch, pitch)
            .environment(\.mapInteractionRotate, rotate)
    }
}
