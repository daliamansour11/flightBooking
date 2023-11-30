import 'package:flightbooking/core/resources/strings_manger.dart';
import 'package:flightbooking/presentation/home/home_widget/CustomTabBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../app/app.dart';
import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/colors_manger.dart';
import '../../../core/resources/translations/languages/language.dart';
import '../../../core/resources/translations/languages/language_constants.dart';
import '../../../core/resources/values_manger.dart';
import '../../../main.dart';

class HomeScreenView extends StatefulWidget {
  @override
  State createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreenView> {

  @override
  Widget build(
    BuildContext context,
  ) {
    mq = MediaQuery.of(context).size;
    return Scaffold(body: HomeScreenPage());
  }
}
class HomeScreenPage extends StatelessWidget {
  HomeScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(

        backgroundColor: ColorsManger.white,
        appBar: _appBar(context),
        body: TabBarView(
          children: [
            CustomTabBarWidget(),
            CustomTabBarWidget(),
            CustomTabBarWidget(),
          ],
        ),
      ),
    );
  }

  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: ColorsManger.primary,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          duration: Duration(seconds: 3),
          child: Column(
            children: [
              _topBar(context),
              _tabBar(context),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(mq.height * 0.19));
  }

  Widget _topBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p36),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
      Flexible(child: buildDrawerItems(context))
           ,
          Text(
         translation(context).bookYourflight,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(right: AppPadding.p19),
            child: CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage(ImageAssets.profile_img)),
          ),
        ],
      ),
    );
  }

  Widget _tabBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44.0, left: 8, right: 8),
      child: TabBar(
          unselectedLabelColor: ColorsManger.semiLightGreyColor,
          labelColor: ColorsManger.primary,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          tabs: [
            Center(
                child: Text(translation(context).oneway,
              style: TextStyle(fontSize: AppSize.s16),
            )),
            Center(
                child: Text(translation(context).roundtrip,
                    style: TextStyle(fontSize: AppSize.s16))),
            Center(
                child: Text(translation(context).multicity,
                    style: TextStyle(fontSize: AppSize.s16))),
          ]),
    );
  }


  Widget buildDrawerItems(BuildContext context) {
    return Padding(
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
            MyApp.setLocale(context, _locale);
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
