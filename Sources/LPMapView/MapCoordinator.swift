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
        var routeTint: UIColor
        var annotationTint: UIColor
        var routeWidth: Double
        var showCallout: Bool
    }

    var configuration: Configuration

    init(configuration: Configuration) {
        self.configuration = configuration
    }

    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyLine = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polyLine)
            renderer.strokeColor = configuration.routeTint
            renderer.lineWidth = configuration.routeWidth
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
}
