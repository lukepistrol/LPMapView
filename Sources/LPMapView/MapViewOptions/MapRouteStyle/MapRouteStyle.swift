//
//  MapRouteStyle.swift
//  
//
//  Created by Lukas Pistrol on 30.12.22.
//

import SwiftUI

/// A type that defines what a route line on a ``MapView`` will look like.
public protocol MapRouteStyle {
    /// The line's tint color.
    var tint: UIColor { get set }

    /// The line's width in points.
    var lineWidth: Double { get set }

    /// The line's end point style.
    var lineCap: CGLineCap { get set }

    /// The behavior how to join two lines together.
    var lineJoin: CGLineJoin { get set }

    /// An array of numbers specifying the dash pattern to use for the path.
    var lineDashPattern: [NSNumber]? { get set }

    /// Sets ``lineDashPattern`` to be an array of `length` and `gap`.
    mutating func setDashPattern(_ length: Double, gap: Double)
}

public extension MapRouteStyle {

    /// Sets ``lineDashPattern`` to be an array of `length` and `gap`.
    mutating func setDashPattern(_ length: Double, gap: Double) {
        let pattern: [NSNumber] = [
            .init(floatLiteral: length),
            .init(floatLiteral: gap)
        ]
        self.lineDashPattern = pattern
    }
}
