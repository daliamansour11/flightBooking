import 'package:flutter/material.dart';

import '../../../core/resources/translations/languages/language.dart';
import '../../../core/resources/translations/languages/language_constants.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: DropdownButton<Language>(
          underline: const SizedBox(),
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 36,
          ),
          onChanged: (Language? language) async {
            if (language != null) {
              Locale _locale = await setLocale(language.languageCode);
              // MyApp.setLocale(context, _locale);
            }
          },
          items: Language.languageList()
              .map<DropdownMenuItem<Language>>(
                (e) => DropdownMenuItem<Language>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: const TextStyle(fontSize: 30),
                  ),
                  Text(e.name)
                ],
              ),
            ),
          )
              .toList(),
        ),
      );
  }

}


class DrawerItem {
  final String title;
  final String icon;

  DrawerItem({
    required this.title,
    required this.icon
  });
}

