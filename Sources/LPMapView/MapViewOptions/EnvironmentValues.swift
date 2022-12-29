//
//  EnvironmentValues.swift
//  
//
//  Created by Lukas Pistrol on 29.12.22.
//

import MapKit
import SwiftUI

extension EnvironmentValues {

    // MARK: Route

    var mapRouteVisibility: MapViewVisibility {
        get { self[MapRouteVisibilityKey.self] }
        set { self[MapRouteVisibilityKey.self] = newValue }
    }

    var mapRouteTint: UIColor {
        get { self[MapRouteTintKey.self] }
        set { self[MapRouteTintKey.self] = newValue }
    }

    var mapRouteWidth: Double {
        get { self[MapRouteWidthKey.self] }
        set { self[MapRouteWidthKey.self] = newValue }
    }

    // MARK: Annotation

    var mapAnnotationVisibility: MapViewVisibility {
        get { self[MapAnnotationVisibilityKey.self] }
        set { self[MapAnnotationVisibilityKey.self] = newValue }
    }

    var mapAnnotationTint: UIColor {
        get { self[MapAnnotationTintKey.self] }
        set { self[MapAnnotationTintKey.self] = newValue }
    }

    var mapShowCallout: Bool {
        get { self[MapShowCalloutKey.self] }
        set { self[MapShowCalloutKey.self] = newValue }
    }

    var mapFitAnnotations: Bool {
        get { self[MapFitAnnotationsKey.self] }
        set { self[MapFitAnnotationsKey.self] = newValue }
    }

    // MARK: Configuration

    var mapConfiguration: MapViewConfiguration {
        get { self[MapConfigurationKey.self] }
        set { self[MapConfigurationKey.self] = newValue }
    }

    var mapElevationStyle: MKMapConfiguration.ElevationStyle {
        get { self[MapElevationStyleKey.self] }
        set { self[MapElevationStyleKey.self] = newValue }
    }
}
