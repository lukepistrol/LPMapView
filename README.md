<p>
  <img src="https://img.shields.io/badge/Swift-5.7-f05318.svg" />
  <img src="https://img.shields.io/badge/iOS->= 16.0-blue.svg" />
  <img alt="GitHub" src="https://img.shields.io/github/license/lukepistrol/lpmapview">
  <a href="https://twitter.com/lukeeep_">
    <img src="https://img.shields.io/badge/Twitter-@lukeeep_-1e9bf0.svg?style=flat" alt="Twitter: @lukeeep_" />
  </a>
</p>

# LPMapView

> 📖 See the full documentation [here](https://lukepistrol.github.io/LPMapView/documentation/lpmapview).

A **SwiftUI** wrapper for `MKMapView`.

## Overview

This offers a couple more features compared to `SwiftUI.Map`.

## Usage

```swift
@State private var coordinateRegion: MKCoordinateRegion = ...
@State private var items: [MapViewAnnotation] = ...

MapView(
  region: $coordinateRegion, 
  showsUserLocation: false,
  userTrackingMode: .none,
  annotations: items
)
.mapDisplayRoute() // connect annotations with lines
.mapRouteStyle(.dashed(5, tint: .systemRed) // Use a dashed line
.mapAnnotations(.visible, tint: .mint) // show annotations with custom tint
.mapConfiguration(.hybrid) // use the hybrid map style
```

The above example usage would deliver a map view similar to this one:

![map-preview](./Sources/LPMapView/Documentation.docc/Resources/map-preview.png)

## Modifiers

There are a couple of modifiers available for configuring additional
options for the map view.

### mapDisplayRoute

#### Declaration

```swift
func mapDisplayRoute(
  _ visibility: MapViewVisibility = .visible
) -> some View
```

#### Parameters

- `visibility`: Whether or not the route will be visible.

### mapRouteStyle

#### Declaration

```swift
func mapRouteStyle(_ style: MapRouteStyle) -> some View
```

#### Parameters

- `style`: The route line style to use.

### mapAnnotations

#### Declaration

```swift
func mapAnnotations(
  _ visibility: MapViewVisibility = .visible, 
  tint: Color = .red, 
  calloutEnabled: Bool = false, 
  fitInVisibleRect: Bool = false
) -> some View
```

#### Parameters

- `visibility`: Whether or not annotations will be visible.
- `tint`: The default tint color of the annotation. This can
be overridden by setting ``MapViewAnnotation/tint`` on
``MapViewAnnotation``.
- `calloutEnabled`: Whether or not to show a detail callout
when an annotation is selected. Note that this will only
work if the annotation has a title.
- `fitInVisibleRect`: Whether or not to automatically adjust
map zoom to fit all annotations.

### mapConfiguration

#### Declaration

```swift
func mapConfiguration(
  _ configuration: MapViewConfiguration, 
  elevationStyle: MKMapConfiguration.ElevationStyle = .flat
) -> some View
```

#### Parameters

- `configuration`: A configuration option defining the map
style.
- `elevationStyle`: Defines how elevation data is handled
when rendering the map view.

---

<a href="https://www.buymeacoffee.com/lukeeep" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>
