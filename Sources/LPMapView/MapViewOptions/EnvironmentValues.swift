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

    var mapRouteStyle: MapRouteStyle {
        get { self[MapRouteStyleKey.self] }
        set { self[MapRouteStyleKey.self] = newValue }
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

    @available(iOS 16.0, *)
    var mapElevationStyle: MKMapConfiguration.ElevationStyle {
        get { self[MapElevationStyleKey.self] }
        set { self[MapElevationStyleKey.self] = newValue }
    }

    var mapPOIFilter: MKPointOfInterestFilter {
        get { self[MapPOIKey.self] }
        set { self[MapPOIKey.self] = newValue }
    }

    @available(iOS 16.0, *)
    var mapSelectableFeatures: MKMapFeatureOptions {
        get { self[MapSelectableFeaturesKey.self] }
        set { self[MapSelectableFeaturesKey.self] = newValue }
    }

    // MARK: User Interaction

    var mapInteractionZoom: Bool {
        get { self[MapZoomInteractionKey.self] }
        set { self[MapZoomInteractionKey.self] = newValue }
    }

    var mapInteractionScroll: Bool {
        get { self[MapScrollInteractionKey.self] }
        set { self[MapScrollInteractionKey.self] = newValue }
    }

    var mapInteractionPitch: Bool {
        get { self[MapPitchInteractionKey.self] }
        set { self[MapPitchInteractionKey.self] = newValue }
    }

    var mapInteractionRotate: Bool {
        get { self[MapRotateInteractionKey.self] }
        set { self[MapRotateInteractionKey.self] = newValue }
    }
}
