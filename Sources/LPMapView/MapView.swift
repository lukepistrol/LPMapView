//
//  MapView.swift
//
//
//  Created by Lukas Pistrol on 29.12.22.
//

import MapKit
import SwiftUI

public struct MapView: UIViewRepresentable {
    public typealias UIViewType = MKMapView

    @Environment(\.mapRouteVisibility) private var routeVisibility
    @Environment(\.mapAnnotationVisibility) private var annotationVisibility
    @Environment(\.mapAnnotationTint) private var annotationTint
    @Environment(\.mapRouteStyle) private var routeStyle
    @Environment(\.mapShowCallout) private var showCallout
    @Environment(\.mapConfiguration) private var mapConfiguration
    @Environment(\.mapElevationStyle) private var elevationStyle
    @Environment(\.mapFitAnnotations) private var fitAnnotations
    @Environment(\.mapPOIFilter) private var poiFilter
    @Environment(\.mapSelectableFeatures) private var selectableFeatures

    @Binding
    private var region: MKCoordinateRegion

    private var showsUserLocation: Bool = false
    private var userTrackingMode: MKUserTrackingMode = .none

    @Binding
    private var points: [MapViewAnnotation]

    private var onSelection: ((MKAnnotation) -> Void)?

    /// Creates a new ``MapView``.
    ///
    /// - Important: When `showsUserLocation` is `true` make sure
    /// you have a description for `NSLocationWhenInUseUsageDescription`
    /// in your app's `Info.plist`.
    ///
    /// - Parameters:
    ///   - region: A binding defining the `MKCoordinateRegion`.
    ///   - showsUserLocation: A boolean defining whether or not
    ///   to show user location.
    ///   - userTrackingMode: Sets the behavior for tracking the
    ///   user's location.
    ///   - annotations: An array of annotations.
    ///   - onSelection: A callback passing in a `MKAnnotation`
    ///   item that was selected in the ``MapView``.
    public init(
        region: Binding<MKCoordinateRegion>,
        showsUserLocation: Bool = false,
        userTrackingMode: MKUserTrackingMode = .none,
        annotations: Binding<[MapViewAnnotation]>,
        onSelection: ((MKAnnotation) -> Void)? = nil
    ) {
        self._region = region
        self._points = annotations
        self.showsUserLocation = showsUserLocation
        self.userTrackingMode = userTrackingMode
        self.onSelection = onSelection
    }

    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = showsUserLocation
        mapView.userTrackingMode = userTrackingMode
        mapView.selectableMapFeatures = selectableFeatures
        
        let preferredConfig: MKMapConfiguration

        switch mapConfiguration {
        case .standard:
            let config = MKStandardMapConfiguration(elevationStyle: elevationStyle)
            config.pointOfInterestFilter = poiFilter
            preferredConfig = config
        case .hybrid:
            let config = MKHybridMapConfiguration(elevationStyle: elevationStyle)
            config.pointOfInterestFilter = poiFilter
            preferredConfig = config
        case .satellite:
            let config = MKImageryMapConfiguration(elevationStyle: elevationStyle)
            preferredConfig = config
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

        if fitAnnotations {
            mapView.showAnnotations(mapView.annotations, animated: true)
        }
    }

    public func makeCoordinator() -> MapCoordinator {

        let configuration = MapCoordinator.Configuration(
            annotationTint: annotationTint,
            showCallout: showCallout,
            routeStyle: routeStyle,
            onSelection: onSelection
        )

        return MapCoordinator(configuration: configuration)
    }
}
