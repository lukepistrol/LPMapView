# ``LPMapView/MapViewAnnotation``

A custom `MKAnnotation` which is used to draw annotation markers
on the ``MapView``.

## Usage

Let's say we have a model struct called _MyModel_

```swift
struct MyModel {
  let name: String
  let infoString: String
  let symbolName: String
  let latitude: Double
  let longitude: Double
}
```

Then we simply create a new instance of ``MapViewAnnotation`` by passing
in the required properties of our model.

> Note: Any property apart from ``coordinate`` is optional. 

```swift
let myModel = MyModel(...)

let annotation = MapViewAnnotation(
  coordinate: CLLocationCoordinate2D(latitude: myModel.latitude, longitude: myModel.longitude),
  title: myModel.name,
  subtitle: myModel.infoString,
  systemImage: myModel.symbolName,
  tint: .systemBlue
)
```
