import 'package:flutter_test/flutter_test.dart';

import 'package:pr_geo/pr_geo.dart';

void main() {
  test('Calculate Distance between coordinates', () {
    GeoCoordinate point1 = GeoCoordinate(
      latitude: 0,
      longitude: 35,
    );
    GeoCoordinate point2 = GeoCoordinate(
      latitude: 0,
      longitude: 47,
    );
    print('Distance between points is: ${PR_Geo.distance(point1, point2)}');
  });
}
