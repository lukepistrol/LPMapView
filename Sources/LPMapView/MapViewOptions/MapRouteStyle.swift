//
//  MapRouteStyle.swift
//  
//
//  Created by Lukas Pistrol on 30.12.22.
//

import Foundation
import MapKit

/// A style for the route lines on a map view between annotations.
public struct MapRouteStyle {
    var tint: UIColor
    var lineWidth: Double
    var lineCap: CGLineCap
    var lineJoin: CGLineJoin
    var lineDashPattern: [NSNumber]?

    init(
        tint: UIColor = .systemBlue,
        lineWidth: Double = 5,
        lineCap: CGLineCap = .round,
        lineJoin: CGLineJoin = .round,
        lineDashPattern: [NSNumber]? = nil
    ) {
        self.tint = tint
        self.lineWidth = lineWidth
        self.lineCap = lineCap
        self.lineJoin = lineJoin
        self.lineDashPattern = lineDashPattern
    }

    /// A solid line with the given width and tint color.
    /// - Parameters:
    ///   - width: The line's width in points.
    ///   - tint: The line's tint color.
    /// - Returns: A ``MapRouteStyle``
    public static func solid(_ width: Double, tint: UIColor = .systemBlue) -> Self {
        .init(tint: tint, lineWidth: width)
    }

    /// A dashed line with the given width and tint color.
    ///
    /// - Note: In order to customize the `lineJoin`, `lineCap`, or `lineDashPattern`
    /// choose the ``custom(_:tint:lineCap:lineJoin:lineDashPattern:)`` variant.
    ///
    /// - Parameters:
    ///   - width: The line's width in points.
    ///   - tint: The line's tint color.
    /// - Returns: A ``MapRouteStyle``
    public static func dashed(_ width: Double, tint: UIColor = .systemBlue) -> Self {
        let pattern: [NSNumber] = [
            .init(floatLiteral: width * 3),
            .init(floatLiteral: width * 4)
        ]
        return .init(tint: tint, lineWidth: width, lineDashPattern: pattern)
    }

    /// A customizable line style
    ///
    /// - Parameters:
    ///   - width: The line's width in points.
    ///   - tint: The line's tint color.
    ///   - lineCap: The line's end point style.
    ///   - lineJoin: The behavior how to join two lines together.
    ///   - lineDashPattern: An array of numbers specifying the dash pattern
    ///   to use for the path.
    /// - Returns: A ``MapRouteStyle``
    public static func custom(
        _ width: Double,
        tint: UIColor,
        lineCap: CGLineCap,
        lineJoin: CGLineJoin,
        lineDashPattern: [NSNumber]?
    ) -> Self {
        .init(tint: tint, lineWidth: width, lineCap: lineCap, lineJoin: lineJoin, lineDashPattern: lineDashPattern)
    }
}
