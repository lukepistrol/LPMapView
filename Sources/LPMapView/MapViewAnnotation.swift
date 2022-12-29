//
//  MapViewAnnotation.swift
//  
//
//  Created by Lukas Pistrol on 29.12.22.
//

import Foundation
import MapKit

public class MapViewAnnotation: NSObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D
    public var title: String?
    public var subtitle: String?
    public var systemImage: String?
    public var tint: UIColor?

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
