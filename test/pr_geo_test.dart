import 'package:flutter_test/flutter_test.dart';

import 'package:pr_geo/pr_geo.dart';

void main() {
  test('Make sure that coordinates are parsed correctly', () {
    GeoCoordinate point1 = GeoCoordinate(
      latitude: 37,
      longitude: -562,
    );
    print('Point latitude: ${point1.latitude},longitude: ${point1.longitude}');
  });
  
}
