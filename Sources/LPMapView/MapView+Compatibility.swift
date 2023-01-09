//
//  SwiftUIView.swift
//  
//
//  Created by Lukas Pistrol on 09.01.23.
//

import MapKit
import SwiftUI

@available(iOS, deprecated: 16, renamed: "MapView")
public struct LMapView: UIViewRepresentable {
    public typealias UIViewType = MKMapView

    // MARK: - Environment

    // MARK: Route
    @Environment(\.mapRouteVisibility) private var routeVisibility
    @Environment(\.mapRouteStyle) private var routeStyle
    // MARK: Annotation
    @Environment(\.mapAnnotationVisibility) private var annotationVisibility
    @Environment(\.mapAnnotationTint) private var annotationTint
    @Environment(\.mapShowCallout) private var showCallout
    @Environment(\.mapFitAnnotations) private var fitAnnotations
    // MARK: Configuration
    @Environment(\.mapConfiguration) private var mapConfiguration
    @Environment(\.mapPOIFilter) private var poiFilter
    // MARK: UserInteraction
    @Environment(\.mapInteractionZoom) private var zoomEnabled
    @Environment(\.mapInteractionScroll) private var scrollEnabled
    @Environment(\.mapInteractionPitch) private var pitchEnabled
    @Environment(\.mapInteractionRotate) private var rotateEnabled

    @Binding
    private var region: MKCoordinateRegion

    private var showsUserLocation: Bool = false
    private var userTrackingMode: MKUserTrackingMode = .none

    @Binding
    private var points: [MapViewAnnotation]

    private var onSelection: ((MKAnnotation) -> Void)?
    private var onLongPress: ((UIGestureRecognizer.State, CLLocationCoordinate2D) -> Void)?
    private var userLocationChanged: ((MKUserLocation?, Error?) -> Void)?

    // MARK: - Init

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
    ///   - onLongPress: A callback passing in the state of a
    ///   `UILongPressGestureRecognizer` and a `CLLocationCoordinate2D`
    ///   from where the gesture happened on the ``MapView``.
    ///   - userLocationChanged: A callback passing in the changed
    ///   `MKUserLocation`.
    public init(
        region: Binding<MKCoordinateRegion>,
        showsUserLocation: Bool = false,
        userTrackingMode: MKUserTrackingMode = .none,
        annotations: Binding<[MapViewAnnotation]>,
        onSelection: ((MKAnnotation) -> Void)? = nil,
        onLongPress: ((UIGestureRecognizer.State, CLLocationCoordinate2D) -> Void)? = nil,
        userLocationChanged: ((MKUserLocation?, Error?) -> Void)? = nil
    ) {
        self._region = region
        self._points = annotations
        self.showsUserLocation = showsUserLocation
        self.userTrackingMode = userTrackingMode
        self.onSelection = onSelection
        self.onLongPress = onLongPress
        self.userLocationChanged = userLocationChanged
    }

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
    ///   - onLongPress: A callback passing in the state of a
    ///   `UILongPressGestureRecognizer` and a `CLLocationCoordinate2D`
    ///   from where the gesture happened on the ``MapView``.
    public init(
        region: Binding<MKCoordinateRegion>,
        showsUserLocation: Bool = false,
        userTrackingMode: MKUserTrackingMode = .none,
        annotations: Binding<[MapViewAnnotation]>,
        onLongPress: ((UIGestureRecognizer.State, CLLocationCoordinate2D) -> Void)?,
        userLocationChanged: ((MKUserLocation?, Error?) -> Void)? = nil
    ) {
        self._region = region
        self._points = annotations
        self.showsUserLocation = showsUserLocation
        self.userTrackingMode = userTrackingMode
        self.onSelection = nil
        self.onLongPress = onLongPress
        self.userLocationChanged = userLocationChanged
    }

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
        onSelection: ((MKAnnotation) -> Void)?,
        userLocationChanged: ((MKUserLocation?, Error?) -> Void)? = nil
    ) {
        self._region = region
        self._points = annotations
        self.showsUserLocation = showsUserLocation
        self.userTrackingMode = userTrackingMode
        self.onSelection = onSelection
        self.onLongPress = nil
        self.userLocationChanged = userLocationChanged
    }

    public func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = showsUserLocation
        mapView.userTrackingMode = userTrackingMode
        mapView.mapType = mapStyle()
        mapView.pointOfInterestFilter = poiFilter
        mapView.isZoomEnabled = zoomEnabled
        mapView.isScrollEnabled = scrollEnabled
        mapView.isPitchEnabled = pitchEnabled
        mapView.isRotateEnabled = rotateEnabled

        mapView.addGestureRecognizer(longPressGesture(in: context))
        return mapView
    }

    public func updateUIView(_ mapView: MKMapView, context: Context) {
        mapView.removeOverlays(mapView.overlays)
        mapView.removeAnnotations(mapView.annotations)

        mapView.showsUserLocation = showsUserLocation
        mapView.userTrackingMode = userTrackingMode
        mapView.mapType = mapStyle()
        mapView.pointOfInterestFilter = poiFilter
        mapView.isZoomEnabled = zoomEnabled
        mapView.isScrollEnabled = scrollEnabled
        mapView.isPitchEnabled = pitchEnabled
        mapView.isRotateEnabled = rotateEnabled

        if routeVisibility == .visible {
            let polyline = MKPolyline(coordinates: points.map { $0.coordinate }, count: points.count)
            mapView.addOverlay(polyline)
        }

        if annotationVisibility == .visible {
            points.forEach { point in
                mapView.addAnnotation(point)
            }
        }

        // fit annotations only when not tracking user location
        if fitAnnotations && userTrackingMode == .none {
            mapView.showAnnotations(mapView.annotations, animated: true)
        }
    }

    public func makeCoordinator() -> MapCoordinator {

        let configuration = MapCoordinator.Configuration(
            annotationTint: annotationTint,
            showCallout: showCallout,
            routeStyle: routeStyle,
            onSelection: onSelection,
            onLongPress: onLongPress,
            userLocationChanged: userLocationChanged
        )

        return MapCoordinator(configuration: configuration)
    }

    // MARK: - Methods

    private func mapStyle() -> MKMapType {
        switch mapConfiguration {
        case .standard:
            return .standard
        case .hybrid:
            return .hybrid
        case .satellite:
            return .satellite
        }
    }

    private func longPressGesture(in context: Context) -> UILongPressGestureRecognizer {
        UILongPressGestureRecognizer(
            target: context.coordinator,
            action: #selector(Coordinator.action(sender:))
        )
    }
}
