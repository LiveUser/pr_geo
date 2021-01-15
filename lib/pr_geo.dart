library pr_geo;
//Puerto Rico Geographic measurement system by Radamés J. Valentín Reyes
import 'package:meta/meta.dart';
import 'dart:math';

///Saves the coordinates in an object
class GeoCoordinate{
  ///Latitude in decimal degrees
  double latitude;
  ///Longitude in decimal degrees
  double longitude;
  ///Height over the sea level
  double altitude;
  GeoCoordinate({@required double latitude,@required double longitude,double altitude = 0}){
    //Make longitude a positive value from 0 to 360 degrees
    if(longitude < 0){
      longitude = longitude.abs();
      longitude %= 360;
      longitude = -longitude;
      longitude += 360;
    }else{
      longitude = longitude % 360;
    }
    //Make the longitude within the -180 to 180 degrees range
    if(0 <= longitude && longitude <= 180){
      //Leave as it is, it is within the range of 0 to 180 degrees
    }else{
      //Find the negative angle of this to place it within the -180 to 0 degrees
      longitude -= 360;
    }
    //TODO: Make the latitude within the -90 to 90 degrees range
      //Make the angle positive if it is negative so that I only have to work with positive angles and use the mod 360 on it to keep the numbers within range
    if(latitude < 0){
      latitude = latitude.abs();
      latitude %= 360;
      latitude = -latitude;
      latitude += 360;
    }else{
      latitude = latitude %= 360;
    }
    //Find the corresponding angles
    if(90 < latitude && latitude <= 180){
      latitude -= 90;
      latitude = 90 - latitude;
      //Flip the longitude
      longitude = -longitude;
    }else if(180 < latitude && latitude < 270){
      latitude -= 180;
      latitude = -latitude;
      //Flip the longitude
      longitude = -longitude;
    }else if(270 <= latitude){
      //Corresponds to the -90 to 0 range, just make the angle negative
      latitude -= 360;
    }else{
      //Leave as it is because it's within the 0 to 90 degrees range
    }
    this.latitude = latitude;
    this.longitude = longitude;
    this.altitude = altitude ?? 0;
  }
}
// ignore: camel_case_types
///class that holds all the library methods
class PR_Geo{
  ///Mean sea level in meters
  static const double SeaLevel = 6371146;
  ///Convert coordinates
  static Map<String,double> _toCoordinates({@required double angle,@required double altitude}){
    double R = altitude + SeaLevel;
    double circumference = 2 * pi * R;
    double position = (angle / 360) * circumference;
    return {
      'x': position,
      'y': R,
    };
  }
  ///Measure distance on the plane
  static double _2dDistance({@required Map<String,double> point1,@required Map<String,double> point2}){
    double deltaX = point1['x'] - point2['x'];
    double deltaY = point1['y'] - point2['y'];
    //a^2 +b^2 = c^2
    double distance = pow(deltaX, 2) + pow(deltaY, 2);
    //Square root to get the distance
    distance = sqrt(distance);
    return distance;
  }
  ///Get distance between coordinates in meters
  static double distance(GeoCoordinate coordinate1,GeoCoordinate coordinate2){   
    double latitudeDistance = _2dDistance(point1: _toCoordinates(angle: coordinate1.latitude,altitude: coordinate1.altitude), point2: _toCoordinates(angle: coordinate2.latitude,altitude: coordinate2.altitude));
    double longitudeDistance = _2dDistance(point1: _toCoordinates(angle: coordinate1.longitude, altitude: coordinate1.altitude), point2: _toCoordinates(angle: coordinate2.longitude, altitude: coordinate2.altitude));
    double altitudeDistance = (coordinate2.altitude - coordinate1.altitude).abs();
    //Subtract the complete vector if the delta of the angles is bigger than 180 degrees
      //Do not do this for the latitude because it is always in a range of -90 to 90 degrees
    double deltaLongitude = (coordinate1.longitude - coordinate2.longitude).abs();
    //Calculate and subtract the complete vector to measure the distance from the other side of the globe
    if(180 < deltaLongitude){
      double completeVector = _2dDistance(point1: _toCoordinates(angle: 180, altitude: coordinate1.altitude), point2: _toCoordinates(angle: -180, altitude: coordinate2.altitude));
      //print('Complete vector: $completeVector longitudeDistance: $longitudeDistance');
      longitudeDistance = completeVector - longitudeDistance;
    }
    //Calculate the total distance by merging all of the vectors together
      //Merge distances in the x,y and z axis
    double absoluteDistance = pow(latitudeDistance, 2) + pow(longitudeDistance, 2) + pow(altitudeDistance, 2);
    //find the square root
    absoluteDistance = sqrt(absoluteDistance);
    return absoluteDistance;
  }
}