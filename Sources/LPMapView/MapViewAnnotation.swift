//
//  MapViewAnnotation.swift
//  
//
//  Created by Lukas Pistrol on 29.12.22.
//

import Foundation
import MapKit

public class MapViewAnnotation: NSObject, MKAnnotation {

    /// The center point (specified as a map coordinate) of the annotation.
    public var coordinate: CLLocationCoordinate2D

    /// The string containing the annotation's title.
    public var title: String?

    /// The string containing the annotation's subtitle.
    public var subtitle: String?

    /// The string describing a SFSymbol which will be used as the
    /// annotation's icon.
    public var systemImage: String?

    /// The color which will be used to tint the annotation marker.
    public var tint: UIColor?

    /// Creates a new ``MapViewAnnotation``.
    ///
    /// - Parameters:
    ///   - coordinate: The center point (specified as a map coordinate)
    ///   of the annotation.
    ///   - title: The string containing the annotation's title.
    ///   - subtitle: The string containing the annotation's subtitle.
    ///   - systemImage: The string describing a SFSymbol which will be
    ///   used as the annotation's icon.
    ///   - tint: The color which will be used to tint the annotation marker.
    public init(
        coordinate: CLLocationCoordinate2D,
        title: String? = nil,
        subtitle: String? = nil,
        systemImage: String? = nil,
        tint: UIColor? = nil
    ) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.systemImage = systemImage
        self.tint = tint
    }
}
