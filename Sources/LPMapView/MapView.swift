//
//  MapView.swift
//
//
//  Created by Lukas Pistrol on 29.12.22.
//

import MapKit
import SwiftUI

/// A **SwiftUI** wrapper for `MKMapView`.
///
/// This offers a couple more features compared to `SwiftUI.Map`.
///
/// **Usage:**
/// ```swift
/// @State private var coordinateRegion: MKCoordinateRegion = ...
/// @State private var items: [MapViewAnnotation] = ...
///
/// MapView(region: $coordinateRegion, annotations: items)
///   // connect annotations with lines
///   .mapDisplayRoute()
/// ```
public struct MapView: UIViewRepresentable {
    public typealias UIViewType = MKMapView

    @Environment(\.mapRouteVisibility) private var routeVisibility
    @Environment(\.mapAnnotationVisibility) private var annotationVisibility
    @Environment(\.mapAnnotationTint) private var annotationTint
    @Environment(\.mapRouteTint) private var routeTint
    @Environment(\.mapRouteWidth) private var routeWidth
    @Environment(\.mapShowCallout) private var showCallout
    @Environment(\.mapConfiguration) private var mapConfiguration
    @Environment(\.mapElevationStyle) private var elevationStyle

    @Binding
    private var region: MKCoordinateRegion

    private var showsUserLocation: Bool = false
    private var userTrackingMode: MKUserTrackingMode = .none

    @State
    private var points: [MapViewAnnotation]

    /// Creates a new ``MapView``.
    ///
    /// - Parameters:
    ///   - region: A binding defining the `MKCoordinateRegion`.
    ///   - showsUserLocation: A boolean defining whether or not
    ///   to show user location.
    ///   - userTrackingMode: Sets the behavior for tracking the
    ///   user's location.
    ///   - annotations: An array of annotations.
    public init(
        region: Binding<MKCoordinateRegion>,
        showsUserLocation: Bool = false,
        userTrackingMode: MKUserTrackingMode = .none,
        annotations: [MapViewAnnotation]
    ) {
        self._region = region
        self.showsUserLocation = showsUserLocation
        self.userTrackingMode = userTrackingMode
        self.points = annotations
    }

    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = showsUserLocation
        mapView.userTrackingMode = userTrackingMode

        let preferredConfig: MKMapConfiguration

        switch mapConfiguration {
        case .standard:
            preferredConfig = MKStandardMapConfiguration(elevationStyle: elevationStyle)
        case .hybrid:
            preferredConfig = MKHybridMapConfiguration(elevationStyle: elevationStyle)
        case .satellite:
            preferredConfig = MKImageryMapConfiguration(elevationStyle: elevationStyle)
        }
        mapView.preferredConfiguration = preferredConfig
        return mapView
    }

    public func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)

        if routeVisibility == .visible {
            let polyline = MKPolyline(coordinates: points.map { $0.coordinate }, count: points.count)
            mapView.addOverlay(polyline)
        }

        if annotationVisibility == .visible {
            points.forEach { point in
                mapView.addAnnotation(point)
            }
        }
        mapView.showAnnotations(mapView.annotations, animated: true)
    }

    public func makeCoordinator() -> MapCoordinator {

        let configuration = MapCoordinator.Configuration(
            routeTint: routeTint,
            annotationTint: annotationTint,
            routeWidth: routeWidth,
            showCallout: showCallout
        )

        return MapCoordinator(configuration: configuration)
    }
}
