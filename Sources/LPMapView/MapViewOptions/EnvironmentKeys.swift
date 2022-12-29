//
//  EnvironmentKeys.swift
//  
//
//  Created by Lukas Pistrol on 29.12.22.
//

import SwiftUI
import MapKit

struct MapRouteVisibilityKey: EnvironmentKey {
    static let defaultValue = MapViewVisibility.hidden
}

struct MapAnnotationVisibilityKey: EnvironmentKey {
    static let defaultValue = MapViewVisibility.visible
}

struct MapAnnotationTintKey: EnvironmentKey {
    static let defaultValue = UIColor.systemRed
}

struct MapRouteTintKey: EnvironmentKey {
    static let defaultValue = UIColor.systemBlue
}

struct MapRouteWidthKey: EnvironmentKey {
    static let defaultValue = 5.0
}

struct MapShowCalloutKey: EnvironmentKey {
    static let defaultValue = false
}

struct MapConfigurationKey: EnvironmentKey {
    static let defaultValue = MapViewConfiguration.standard
}

struct MapElevationStyleKey: EnvironmentKey {
    static let defaultValue = MKMapConfiguration.ElevationStyle.flat
}
