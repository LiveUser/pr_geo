library pr_geo;
//Puerto Rico Geographic measurement system
import 'package:flutter/cupertino.dart';

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
class PR_Geo{
  //Mean sea level in meters
  static const double SeaLevel = 6371146;
  //Get distance between coordinates in meters
  static double distance(GeoCoordinate coordinate1,GeoCoordinate coordinate2){

  }
}