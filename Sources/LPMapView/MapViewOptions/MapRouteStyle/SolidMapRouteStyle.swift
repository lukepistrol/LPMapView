//
//  SolidMapRouteStyle.swift
//  
//
//  Created by Lukas Pistrol on 30.12.22.
//

import SwiftUI

/// A ``MapRouteStyle`` defining a solid line with the given width and tint color.
public struct SolidMapRouteStyle: MapRouteStyle {
    public var tint: UIColor

    public var lineWidth: Double

    public var lineCap: CGLineCap = .round

    public var lineJoin: CGLineJoin = .round

    public var lineDashPattern: [NSNumber]?

    public init(_ width: Double, tint: Color = .blue) {
        self.lineWidth = width
        self.tint = UIColor(tint)
    }
}

public extension MapRouteStyle where Self == SolidMapRouteStyle {
    /// A solid line with the given width and tint color.
    /// - Parameters:
    ///   - width: The line's width in points.
    ///   - tint: The line's tint color.
    /// - Returns: A ``SolidMapRouteStyle``
    static func solid(_ width: Double, tint: Color = .blue) -> SolidMapRouteStyle {
        SolidMapRouteStyle(width, tint: tint)
    }
}
