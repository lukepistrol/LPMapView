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

struct MapRouteTintKey: EnvironmentKey {
    static let defaultValue = UIColor.systemBlue
}

struct MapRouteWidthKey: EnvironmentKey {
    static let defaultValue = 5.0
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