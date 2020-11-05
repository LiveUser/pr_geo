library pr_geo;
//Puerto Rico Geographic measurement system
import 'package:flutter/cupertino.dart';
import 'dart:math';

//Mean sea level in km
const double SeaLevel = 6371146;
//TODO: Add an option to input distance in different units
class GeoCoordinate{
  final double latitude;
  final double longitude;
  //Height over the sea level
  final double altitude;
  GeoCoordinate({@required this.latitude,@required this.longitude,this.altitude = 0});
}
// ignore: camel_case_types
class PR_Geo{
  static double _degreesToCoordinate({@required double angle,@required double altitude}){
    //Calculate the radius of the coordinate
    double r = altitude + SeaLevel;
    //Calculate the Circumference
    double C = 2 * pi * r;
    double distance;
    if(0 <= angle && angle <= 180){
      distance = angle/360 * C;
    }else if(1808 < angle && angle <= 360){
      distance = -1 * ((angle - 180)/360 * C);
    }else{
      //Accept negative coordinates in the future
      throw 'Coordinates out of range: angle must be between 0 and 360 degrees';
    }
    return distance;
  }
  //Distance is given in kilometers
  static double distance(GeoCoordinate coordinate1,GeoCoordinate coordinate2){
    //Perform vertical cross section calculations
    double lonX1 = _degreesToCoordinate(angle: coordinate1.longitude, altitude: coordinate1.altitude);
    double lonX2 = _degreesToCoordinate(angle: coordinate2.longitude, altitude: coordinate2.altitude);
    double deltaX1 = lonX1 - lonX2;
    double deltaY1 = coordinate1.altitude - coordinate2.altitude;
    double lonDistance = pow(deltaX1,2) + pow(deltaY1,2);
    lonDistance = sqrt(lonDistance);
      //print('Longitude distance: $lonDistance');
    //Perform horizontal cross section calculations
    double latX1 = _degreesToCoordinate(angle: coordinate1.latitude, altitude: coordinate1.altitude);
    double latX2 = _degreesToCoordinate(angle: coordinate2.latitude, altitude: coordinate2.altitude);
    double deltaX2 = latX1 - latX2;
    double deltaY2 = coordinate1.altitude - coordinate2.altitude;
    double latDistance = pow(deltaX2,2) + pow(deltaY2, 2);
    latDistance = sqrt(latDistance);
      //print('Latitude distance: $latDistance');
    //Use a top view where the planes get merged and now I can use them as if it where a cartesian plane
    double totalDistance = pow(lonDistance, 2) + pow(latDistance,2);
    totalDistance = sqrt(totalDistance);
    return totalDistance;
  }
}