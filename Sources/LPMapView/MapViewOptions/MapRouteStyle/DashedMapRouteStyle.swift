//
//  DashedMapRouteStyle.swift
//  
//
//  Created by Lukas Pistrol on 30.12.22.
//

import SwiftUI

/// A ``MapRouteStyle`` defining a dashed line with the given width and tint color.
public struct DashedMapRouteStyle: MapRouteStyle {
    public var tint: UIColor

    public var lineWidth: Double

    public var lineCap: CGLineCap = .round

    public var lineJoin: CGLineJoin = .round

    public var lineDashPattern: [NSNumber]?

    public init(_ width: Double, tint: Color = .blue) {
        self.lineWidth = width / 2
        self.tint = UIColor(tint)
        self.setDashPattern(width / 2 * 3, gap: width / 2 * 4)
    }
}

public extension MapRouteStyle where Self == DashedMapRouteStyle {
    /// A dashed line with the given width and tint color.
    ///
    /// - Parameters:
    ///   - width: The line's width in points.
    ///   - tint: The line's tint color.
    /// - Returns: A ``DashedMapRouteStyle``
    static func dashed(_ width: Double, tint: Color = .blue) -> DashedMapRouteStyle {
        DashedMapRouteStyle(width, tint: tint)
    }
}
