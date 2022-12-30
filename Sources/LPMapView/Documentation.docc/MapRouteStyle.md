# ``LPMapView/MapRouteStyle``

## Overview

Use a ``MapRouteStyle`` to define what a route line will look like on the map view.

There are two standard implementations available: ``solid(_:tint:)`` and ``dashed(_:tint:)``. Additionally ``custom(_:tint:lineCap:lineJoin:lineDashPattern:)`` allows to create a custom implementation.

## Customization

To create a custom implementation simply extend ``MapRouteStyle`` and add a static property or method which calls and returns ``custom(_:tint:lineCap:lineJoin:lineDashPattern:)``.

```swift
extension MapRouteStyle {
  static let myRouteStyle: Self {
    .custom(...)
  }
}
```

## Topics

### Predefined Styles

- ``solid(_:tint:)``
- ``dashed(_:tint:)``

### Custom Style

- ``custom(_:tint:lineCap:lineJoin:lineDashPattern:)``
