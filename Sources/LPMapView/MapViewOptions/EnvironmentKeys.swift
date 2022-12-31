//
//  EnvironmentKeys.swift
//  
//
//  Created by Lukas Pistrol on 29.12.22.
//

import MapKit
import SwiftUI

// MARK: Route

struct MapRouteVisibilityKey: EnvironmentKey {
    static let defaultValue = MapViewVisibility.hidden
}

struct MapRouteStyleKey: EnvironmentKey {
    static let defaultValue: MapRouteStyle = .solid(5)
}

// MARK: Annotation

struct MapAnnotationVisibilityKey: EnvironmentKey {
    static let defaultValue = MapViewVisibility.visible
}

struct MapAnnotationTintKey: EnvironmentKey {
    static let defaultValue = UIColor.systemRed
}

struct MapShowCalloutKey: EnvironmentKey {
    static let defaultValue = false
}

struct MapFitAnnotationsKey: EnvironmentKey {
    static let defaultValue = false
}

// MARK: Configuration

struct MapConfigurationKey: EnvironmentKey {
    static let defaultValue = MapViewConfiguration.standard
}

struct MapElevationStyleKey: EnvironmentKey {
    static let defaultValue = MKMapConfiguration.ElevationStyle.flat
}

struct MapPOIKey: EnvironmentKey {
    static let defaultValue = MKPointOfInterestFilter.includingAll
}

struct MapSelectableFeaturesKey: EnvironmentKey {
    static let defaultValue: MKMapFeatureOptions = []
}

// MARK: User Interaction

struct MapZoomInteractionKey: EnvironmentKey {
    static let defaultValue = true
}

struct MapScrollInteractionKey: EnvironmentKey {
    static let defaultValue = true
}

struct MapPitchInteractionKey: EnvironmentKey {
    static let defaultValue = true
}

struct MapRotateInteractionKey: EnvironmentKey {
    static let defaultValue = true
}
