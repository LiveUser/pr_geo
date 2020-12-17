# PR_Geo

A library that calculates Geo-Distance using the Puerto Rico Geographic Measurement Method created by Radamés J. Valentín Reyes.

Hecho en 🇵🇷 por Radamés J. Valentín Reyes.

## Parameters

Latitude and longitude should be passed in the form of a double representing decimal degrees.

Distance is always returned in meters.

## Methods

~~~dart
//Calculates the distance between two points
PR_Geo.distance(point1, point2);
~~~

## Examples:

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

~~~dart
GeoCoordinate point1 = GeoCoordinate(
	latitude: -45,
	longitude: 180,
);
GeoCoordinate point2 = GeoCoordinate(
	latitude: 22,
	longitude: -100,
);
double totalDistance = PR_Geo.distance(point1, point2);
print('Noaa online tool says it should be 10966km');
print('Total distance is: $totalDistance m');
~~~

Note: You can email me in case you find any bugs or incorrect results.  Because of the fact that the distance is calculated using a method different to the traditional ones and the Sea Level value online is rounded you should expect a slightly different result. My method is very simple and thus requires very low computing power because of the low level of complexity behind it.

# Technical Specifications

- If the latitude and longitude angles exceed 360 degrees the GeoCoordinate class will automatically find the corresponding angle and you won't get any errors
  - Reference: https://www.mathisfun.com/geometry/parallel-lines.html (Parallel Lines and pairs of angles)
- To comply with the way that geographic coordinates work today latitude will always be kept in a -90 to 90 degrees range and the longitude will always be kept from -180 to 180 degrees.
  - Reference: LatLong.net article on Latitude and Longitude Finder
- Since latitude range goes from -90 to 90 degrees range angles corresponding to angles outside that range will use the given longitude as reference to find the corresponding latitude angle within the -90 to 90 degrees range on the other side of the globe, thus changing the longitude.
  - Example: latitude: 95, longitude: 23 will be converted into latitude: 85.0,longitude: -23.0
- No limitations exist on this library on angle range because in order to always meet the criteria stated above the library will always automatically find the corresponding angle and can work with a range of numbers from negative infinity to positive infinity.
- Puerto Rico Geographic Measurement Method is a yet unpublished(this was written in December 16 2020) method created by me which consists in creating planar representations of two circular cross-sections of a sphere to be able to position in a simple plane measure distance linearly without having to use integrals and other methods.
  - This method assumes the earth is a perfect sphere
  - One of the cross sections is for the latitude and one for the longitude

# Personal thoughts/Story

Measuring stuff that's hard/impossible to calculate without using integrals was my primary focus because I hate working with integrals because they are really hard for me. The first person I commented this method to outside my family was to My physics professor Horacio, Director of the department of mathematics at the Polytechnic University of Puerto Rico(I do not like the university but the guy is really nice). I hope that during my lifetime I am able to derive formulas from this method so that calculating problems that generally involve integrals no longer requires integrating and can be done using simple equations to simplify the life of many people who have the same problem and reduce the complexity in mathematical problems.



## This library's main purpose is to demonstrate that my mathematical method works, has real applications and can replace any previous library. Also that I solved an Integral without integrating and I'm really proud of it.

 

# Issues:

Please email me with any error/issue you find because I put a lot of effort into getting this to work and really want it to be as perfect as it can possibly be. This library is one of my biggest prides because of the mathematical method it holds at its core.