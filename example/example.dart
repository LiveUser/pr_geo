import 'package:pr_geo/pr_geo.dart';

void main() {
  GeoCoordinate point1 = GeoCoordinate(
    latitude: 0,
    longitude: 1,
  );
  GeoCoordinate point2 = GeoCoordinate(
    latitude: 0,
    longitude: 2,
  );
  print('Distance between points is: ${PR_Geo.distance(point1, point2)}');
}