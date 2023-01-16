# ``LPMapView/MapView``

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
  annotations: $items
)
.mapDisplayRoute() // connect annotations with lines
.mapRouteStyle(.dashed(5, tint: .red) // Use a dashed line
.mapAnnotations(.visible, tint: .mint) // show annotations with custom tint
.mapConfiguration(.hybrid) // use the hybrid map style
```

The above example usage would deliver a map view similar to this one:

![map-preview](map-preview)

## Modifiers

There are a couple of modifiers available for configuring additional
options for the map view.

### mapDisplayRoute

**Declaration**

```swift
func mapDisplayRoute(
  _ visibility: MapViewVisibility = .visible
) -> some View
```

**Parameters**

- `visibility`: Whether or not the route will be visible.

### mapRouteStyle

**Declaration**

```swift
func mapRouteStyle(_ style: MapRouteStyle) -> some View
```

**Parameters**

- `style`: The route line style to use. (``MapRouteStyle``)

### mapAnnotations

**Declaration**

```swift
func mapAnnotations(
  _ visibility: MapViewVisibility = .visible, 
  tint: Color = .red, 
  calloutEnabled: Bool = false, 
  fitInVisibleRect: Bool = false,
  animated: Bool = true
) -> some View
```

**Parameters**

- `visibility`: Whether or not annotations will be visible.
- `tint`: The default tint color of the annotation. This can
be overridden by setting ``MapViewAnnotation/tint`` on
``MapViewAnnotation``.
- `calloutEnabled`: Whether or not to show a detail callout
when an annotation is selected. Note that this will only
work if the annotation has a title.
- `fitInVisibleRect`: Whether or not to automatically adjust
map zoom to fit all annotations.
- `animated`: Whether or not to animate changes.

### mapConfiguration

**Declaration**

```swift
func mapConfiguration(
  _ configuration: MapViewConfiguration, 
  elevationStyle: MKMapConfiguration.ElevationStyle = .flat,
  poiFilter: MKPointOfInterestFilter = .includingAll,
  selectableFeatures: MKMapFeatureOptions = []
) -> some View
```

**Parameters**

- `configuration`: A configuration option defining the map
style.
- `elevationStyle`: Defines how elevation data is handled
when rendering the map view.
- `poiFilter`: A filter that includes or excludes point of
interest categories from a map view, local search, or local
search completer.
- `selectableFeatures`: Describes which selectable features
the map responds to.

### mapUserInteraction

**Declaration**

```swift
func mapUserInteraction(
  zoom: Bool = true, 
  scroll: Bool = true, 
  pitch: Bool = true, 
  rotate: Bool = true
) -> some View
```

**Parameters**

- `zoom`: A Boolean value that determines whether the user may
use pinch gestures to zoom in and out of the map.
- `scroll`: A Boolean value that determines whether the user
may scroll around the map.
- `pitch`: A Boolean value that indicates whether the map uses
the camera’s pitch information.
- `rotate`: A Boolean value that indicates whether the map uses
the camera’s heading information.
