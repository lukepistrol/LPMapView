# ``LPMapView/MapRouteStyle``

## Overview

Use a ``MapRouteStyle`` to define what a route line will look like on the map view.

There are two standard implementations available: ``solid(_:tint:)`` and ``dashed(_:tint:)``.

## Customization

In order to create a custom ``MapRouteStyle`` create a new struct conforming to this protocol.

```swift
struct MyMapRouteStyle: MapRouteStyle {
  var tint: UIColor = UIColor(...)
  var lineWidth: Double = 2.5
  var lineCap: CGLineCap = .round
  var lineJoin: CGLineJoin = .round
  var lineDashPattern: [NSNumber]?
}
```

Now the style can be used on your ``MapView`` like so.

```swift
MapView(...)
  .mapRouteStyle(MyMapRouteStyle())
```

Additionally you can also create an extension to ``MapRouteStyle``.

```swift
extension MapRouteStyle where Self == MyMapRouteStyle {
  static var myStyle: MyMapRouteStyle {
    MyMapRouteStyle()
  }
}
```

With that extension in place the style can now be obtained like so.

```swift
MapView(...)
  .mapRouteStyle(.myStyle)
```

## Topics

### Solid Style

- ``solid(_:tint:)``
- ``SolidMapRouteStyle``

### Dashed Style

- ``dashed(_:tint:)``
- ``DashedMapRouteStyle``
