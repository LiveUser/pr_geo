# PR_Geo

A library that calculates Geo-Distance using the Puerto Rico Geographic Measurement Method created by Radamés J. Valentín Reyes.

## Parameters

Latitude and longitude should be passed in the form of a double representing decimal degrees.

Distance is always returned in meters.

## Methods

~~~dart
//Calculates the distance between two points
PR_Geo.distance(point1, point2);
~~~

## Example:

~~~dart
GeoCoordinate point1 = GeoCoordinate(
  latitude: 0,
  longitude: 1,
);
GeoCoordinate point2 = GeoCoordinate(
  latitude: 0,
  longitude: 2,
);
print('Distance between points is: ${PR_Geo.distance(point1, point2)}');
~~~

Note: You can email me in case you find any bugs or incorrect results.  Because of the fact that the distance is calculated using a method different to the traditional ones and the Sea Level value online is rounded you should expect a slightly different result. My method is very simple and thus requires very low computing power because of the low level of complexity behind it.

Hecho en 🇵🇷 por Radamés J. Valentín Reyes.

