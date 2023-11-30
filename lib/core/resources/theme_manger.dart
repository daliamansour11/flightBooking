import 'package:flightbooking/core/resources/styles_manger.dart';
import 'package:flightbooking/core/resources/values_manger.dart';
import 'package:flutter/material.dart';

import 'colors_manger.dart';
import 'font_manger.dart';

ThemeData getAppTheme(){
  return ThemeData(
    //mainColors

    primaryColor: ColorsManger.primary,
     primaryColorLight: ColorsManger.lightPrimary,
      primaryColorDark: ColorsManger.darkPrimary,
    disabledColor: ColorsManger.grey,
    splashColor: ColorsManger.lightPrimary,
    //card theme
    cardTheme: CardTheme(
      color: ColorsManger.white,
      shadowColor: ColorsManger.grey,
      elevation: AppSize.s4
    ),
    // app Bar Theme
    appBarTheme: AppBarTheme(
centerTitle: true,
      color: ColorsManger.primary,
      elevation: AppSize.s4,
      shadowColor: ColorsManger.lightPrimary,
      titleTextStyle: getRegularStyle(color: ColorsManger.white,fontSize: FontSize.s16),
  ),

    //button theme
buttonTheme: ButtonThemeData(
  shape:const StadiumBorder(),
  disabledColor: ColorsManger.grey,
  buttonColor: ColorsManger.primary,
  splashColor: ColorsManger.lightPrimary,
  ),


    //elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         textStyle: getRegularStyle(color:ColorsManger.white,fontSize: FontSize.s18 )
     , primary:  ColorsManger.primary,
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(AppSize.s20))

    )),
    
    // input docoration theme (text field theme)

    textTheme: TextTheme(
      headlineLarge:getSemiBoldStyle(color: ColorsManger.darkGrey,
  fontSize: FontSize.s16),
        headlineMedium: getBoldStyle(color: ColorsManger.dark,fontSize: FontSize.s14,decoration:TextDecoration.none ),
labelSmall: getRegularStyle(color: ColorsManger.white,fontSize: FontSize.s13),
labelMedium: getBoldStyle(color:  ColorsManger.primary,fontSize: FontSize.s18,decoration:TextDecoration.none ),
        labelLarge: getSemiBoldStyle(color: ColorsManger.semiLightGreyColor,fontSize: FontSize.s18),
        titleMedium: getMediumStyle(color: ColorsManger.white,fontSize: FontSize.s22,),
        titleSmall: getSemiBoldStyle(color: ColorsManger.primary,fontSize: FontSize.s18 ,),
       bodySmall:getBoldStyle(color: ColorsManger.primary,fontSize: FontSize.s20, decoration: TextDecoration.none),
        bodyLarge: getBoldStyle(color: ColorsManger.primary,fontSize: FontSize.s16,decoration:TextDecoration.none),
  titleLarge: getBoldStyle( color: ColorsManger.darkGrey,fontSize:   FontSize.s24,decoration:TextDecoration.none),
  displayMedium: getBoldStyle(color: ColorsManger.white,fontSize:   FontSize.s25,decoration:TextDecoration.none),
  bodyMedium: getBoldStyle(color: ColorsManger.white,fontSize:
  FontSize.s16,decoration:TextDecoration.underline),
  displayLarge:
  getBoldStyle(color: ColorsManger.darkGrey,
      fontSize:   FontSize.s34,decoration:  TextDecoration.none)),

       ///input docorection theme
       inputDecorationTheme: InputDecorationTheme(
      contentPadding:  const EdgeInsets.all(AppPadding.p8),
       hintStyle: getRegularStyle(color: ColorsManger.grey,fontSize: FontSize.s14),
       labelStyle: getRegularStyle(color: ColorsManger.grey,fontSize: FontSize.s14),

       errorStyle: getRegularStyle(color: ColorsManger.error,fontSize: FontSize.s14),
/// enabled Border Style
         enabledBorder: OutlineInputBorder(
           borderSide: BorderSide(
color: ColorsManger.primary,width: AppSize.s1_5,),
           borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),

         ),

         //focused Border Style
         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: ColorsManger.grey,width: AppSize.s1_5,),
           borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
         ),

         ////error Border style

         errorBorder:  OutlineInputBorder(
           borderSide: BorderSide(
             color: ColorsManger.error,width: AppSize.s1_5,),
           borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),

         ),
         focusedErrorBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: ColorsManger.primary,width: AppSize.s1_5,),
           borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),

         ),
  )
  );



}