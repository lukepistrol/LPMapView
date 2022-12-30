//
//  MapCoordinator.swift
//  
//
//  Created by Lukas Pistrol on 29.12.22.
//

import Foundation
import MapKit

public class MapCoordinator: NSObject, MKMapViewDelegate {

    struct Configuration {
        var annotationTint: UIColor
        var showCallout: Bool
        var routeStyle: MapRouteStyle
        var onSelection: ((MKAnnotation) -> Void)?
        var onLongPress: ((UIGestureRecognizer.State, CLLocationCoordinate2D) -> Void)?
    }

    var configuration: Configuration

    init(configuration: Configuration) {
        self.configuration = configuration
    }

    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyLine = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyLine)
            renderer.strokeColor = configuration.routeStyle.tint
            renderer.lineWidth = configuration.routeStyle.lineWidth
            renderer.lineCap = configuration.routeStyle.lineCap
            renderer.lineJoin = configuration.routeStyle.lineJoin
            renderer.lineDashPattern = configuration.routeStyle.lineDashPattern
            return renderer
        }
        return MKPolygonRenderer()
    }

    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? MapViewAnnotation {
            return markerAnnotationView(from: annotation)
        }
        return nil
    }

    public func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        configuration.onSelection?(annotation)
    }

    private func markerAnnotationView(from annotation: MapViewAnnotation) -> MKMarkerAnnotationView {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
        annotationView.animatesWhenAdded = false
        annotationView.markerTintColor = annotation.tint ?? configuration.annotationTint
        annotationView.displayPriority = .required
        if let systemImage = annotation.systemImage {
            annotationView.glyphImage = UIImage(systemName: systemImage)
            annotationView.leftCalloutAccessoryView = UIImageView(image: .init(systemName: systemImage))
        }
        if annotation.title != nil {
            annotationView.canShowCallout = configuration.showCallout
            annotationView.rightCalloutAccessoryView = UIView(frame: .zero)
        }
        return annotationView
    }

    @objc func action(sender: Any?) {
        if let longPress = sender as? UILongPressGestureRecognizer,
           let mapView = longPress.view as? MKMapView {
            let location = longPress.location(in: mapView)
            let coordinates = mapView.convert(location, toCoordinateFrom: mapView)
            configuration.onLongPress?(longPress.state, coordinates)
        }
    }
}
