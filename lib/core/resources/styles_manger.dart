

import 'package:flutter/material.dart';

import 'font_manger.dart';

TextStyle _getTextStyle(
    double fontSize,
    FontWeight fontWeight
    ,Color color){
  return TextStyle(fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      // decorationStyle: TextDecorationStyle.double,
      fontFamily: FontConstants.fontFamily);
}
//regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,

  required Color color
}){
  return _getTextStyle(fontSize, FontWeihtManger.regular, color);
}

//medium style
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color}){
  return _getTextStyle(fontSize, FontWeihtManger.medium, color);
}



//light style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color}){
  return _getTextStyle(fontSize, FontWeihtManger.light, color);
}


//bold style
TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  required TextDecoration decoration,
  required Color color}){
  return _getTextStyle(fontSize, FontWeihtManger.bold, color);
}

//semiBold style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s12,

  required Color color}){
  return _getTextStyle(fontSize, FontWeihtManger.semiBold, color,);
}