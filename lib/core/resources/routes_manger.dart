

import 'package:flightbooking/core/resources/strings_manger.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../presentation/home/view/HomeScreen.dart';



class Routes{
  static const String splashRoute= "/";

  static const String homeRoute= "/";
  static const String categoryRoute= "/";
  static const String cartRoute= "/";
  static const String favouriteRoute= "/";
  static const String detailsRoute= "/";
  static const String profileRoute= "/";
}
class RoutesGenerator{
  static Route<dynamic>getRoute(RouteSettings settings){
    switch(settings.name){
      //


      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_)=>HomeScreenView());



    default:
      return unDefinedRoute();

    }

  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(
        title: Text(AppString.noRouteFound),
      ),
      body:  Center(child: Text(AppString.noRouteFound)),
    ));
  }
}