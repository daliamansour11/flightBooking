

import 'package:flutter/material.dart';
import '../core/resources/routes_manger.dart';
import '../core/resources/theme_manger.dart';
import '../core/resources/translations/languages/language_constants.dart';
import '../l10n/app_localizations.dart';


class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key); //default con structor

   /// named constructor
   MyApp._internal();
   int appstate =0;
   static final MyApp _instance =  MyApp._internal();  ///singleton or single instance
   factory MyApp() => _instance;
   @override
   State<MyApp> createState() => _MyAppState();

   static void setLocale(BuildContext context, Locale newLocale) {
     _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
     state?.setLocale(newLocale);
   }
}




class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }


  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.getRoute,
      initialRoute:Routes.splashRoute ,
      locale: _locale,
      theme: getAppTheme(),);
  }
}
// class Test extends StatelessWidget {
//   const Test({Key? key}) : super(key: key);
// void updateState(){
//   MyApp().appstate=11;
// }
//   void getappState(){
//     print( MyApp().appstate);
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Container();
//   }
// }


