import 'package:flutter_test/flutter_test.dart';

import 'package:pr_geo/pr_geo.dart';

void main() {
  test('Make sure that coordinates are parsed correctly', () {
    GeoCoordinate point1 = GeoCoordinate(
      latitude: 95,
      longitude: 23,
    );
    print('Point latitude: ${point1.latitude},longitude: ${point1.longitude}');
  });
  test('Latitude Distance test', (){
    GeoCoordinate point1 = GeoCoordinate(
      latitude: 18,
      longitude: 0,
    );
    GeoCoordinate point2 = GeoCoordinate(
      latitude: -25,
      longitude: 0,
    );
    double totalDistance = PR_Geo.distance(point1, point2);
    print('Noaa online tool says it should be 4778km');
    print('Total distance is: $totalDistance m');
  });
  test('Longitude distance test', (){
    GeoCoordinate point1 = GeoCoordinate(
      latitude: 0,
      longitude: 175,
    );
    GeoCoordinate point2 = GeoCoordinate(
      latitude: 0,
      longitude: 155,
    );
    double totalDistance = PR_Geo.distance(point1, point2);
    print('Noaa online tool says it should be 2222km');
    print('Total distance is: $totalDistance m');
  });
  test('More than 180 degrees distance test', (){
    GeoCoordinate point1 = GeoCoordinate(
      latitude: 0,
      longitude: 180,
    );
    GeoCoordinate point2 = GeoCoordinate(
      latitude: 0,
      longitude: -100,
    );
    double totalDistance = PR_Geo.distance(point1, point2);
    print('Noaa online tool says it should be 8890km');
    print('Total distance is: $totalDistance m');
  });
  test('Combined coordinates test(both lat and lon values)', (){
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
  });
}
