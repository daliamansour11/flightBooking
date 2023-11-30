import 'package:dotted_border/dotted_border.dart';
import 'package:flightbooking/core/resources/colors_manger.dart';
import 'package:flightbooking/core/resources/strings_manger.dart';
import 'package:flightbooking/core/resources/values_manger.dart';
import 'package:flightbooking/main.dart';
import 'package:flightbooking/presentation/home/view/SearchFlightResultView.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/resources/translations/languages/language_constants.dart';

class CustomTabBarWidget extends StatefulWidget {
  const CustomTabBarWidget({Key? key}) : super(key: key);

  @override
  State<CustomTabBarWidget> createState() => _CustomTabBarWidgetState();
}

final List<int> passenger_num = [1, 2, 3, 4, 5, 6, 7, 8];
var selectedAdultNum;
var selectedChildNum;
bool isright=false;
bool istab1Selected = false;
bool istab2Selected = false;
bool istab3Selected = false;
DateTime? _selectedDate;
TextEditingController from_Controller = TextEditingController();
TextEditingController to_Controller = TextEditingController();
TextEditingController date_Controller = TextEditingController();
bool isBusinessClicked = false;
bool isEconnomyClicked = false;
bool isFirstClicked = false;
var _formKey = GlobalKey<FormState>();
void _submit() {
  final isValid = _formKey.currentState!.validate();
  if (!isValid) {
    return;
  }
  _formKey.currentState!.save();
}
class _CustomTabBarWidgetState extends State<CustomTabBarWidget> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mq.height * 0.42,
              child: DottedBorder(
                dashPattern: [
                  5,
                  4,
                ],
                strokeCap: StrokeCap.round,
                strokeWidth: 1,
                borderType: BorderType.RRect,
                radius: Radius.circular(15),
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: AppPadding.p4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Flexible(
                              child: TextField(
                                style: TextStyle(color: ColorsManger.primary),
                                controller: from_Controller,
                                decoration: InputDecoration(
                                  // hintText: AppString.from,
                                  labelText: translation(context).from,
                                  labelStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorsManger.lightPrimary)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              ColorsManger.semiLightGreyColor)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Flexible(
                              child: TextField(

                                style: TextStyle(color: ColorsManger.primary),
                                controller: to_Controller,
                                decoration: InputDecoration(
                                  // hintText: AppString.to,
                                  labelText:translation(context).to,
                                  labelStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: ColorsManger.lightPrimary)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              ColorsManger.semiLightGreyColor)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: AppPadding.p140),
                        child: TextField(
                          style: TextStyle(color: ColorsManger.primary),
                          controller: date_Controller,
                          decoration: InputDecoration(
                            // hintText: AppString.to,
                            labelText: translation(context).departure,
                            labelStyle: Theme.of(context).textTheme.labelLarge,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorsManger.lightPrimary)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: ColorsManger.semiLightGreyColor)),

                            hintStyle: TextStyle(color: Colors.black45),
                            errorStyle: TextStyle(color: Colors.redAccent),
                            // suffixIcon: Icon(Icons.event_note,s),
                          ),
                          onTap: () async {
                            DateTime? newSelectedDate = await showDatePicker(
                                context: context,
                                initialDate: _selectedDate != null
                                    ? _selectedDate!
                                    : DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2040),
                                builder: (context, child) {
                                  return Theme(
                                    data: ThemeData.dark().copyWith(
                                      colorScheme: ColorScheme.dark(
                                        primary: Colors.deepPurple,
                                        onPrimary: Colors.white,
                                        surface: Colors.blueGrey,
                                        onSurface: Colors.yellow,
                                      ),
                                      dialogBackgroundColor: Colors.blue[500],
                                    ),
                                    child: child!,
                                  );
                                });
                            if (newSelectedDate != null) {
                              _selectedDate = newSelectedDate;
                              date_Controller
                                ..text = DateFormat("yyyy-MMMM-dd")
                                    .format(_selectedDate!)
                                ..selection = TextSelection.fromPosition(
                                    TextPosition(
                                        offset: date_Controller.text.length,
                                        affinity: TextAffinity.upstream));
                              print(
                                  "daaaaaaaaaaaaaaaaa${date_Controller.text.runtimeType}");
                            }

                          },
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: AppSize.s12,
                          ),
                          Flexible(
                              child: Text(
                                translation(context).adults,
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                          SizedBox(width: AppSize.s132),
                          Flexible(
                              child: Text(
                                translation(context).children,
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox( height: AppSize.s12),
                          DropdownButton(
                            isDense: false,
                            icon: isright?
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,),
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                size: AppSize.s33,
                              ),
                            ):  Padding(
                                padding: const EdgeInsets.only(right: 10.0,),
                                child: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: AppSize.s33,
                                )),
                            iconEnabledColor: ColorsManger.primary,
                            itemHeight: mq.height * 0.081,
                            hint: Text(
                              "0",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            dropdownColor: Colors.white,
                            value: selectedAdultNum,
                            items: passenger_num
                                .map((e) =>DropdownMenuItem(
                              child:isright==true?

                              Padding(
                                padding: const EdgeInsets.only(left: 78.0),
                                child: Text(
                                  " $e",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium,
                                ),
                              ):  Padding(
                                padding: const EdgeInsets.only(right: 58.0),
                                child: Text(
                                  " $e",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium,
                                ),
                              ),
                              value: e,
                            ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedAdultNum = value;
                              });
                            },
                          ),
                          SizedBox(width: 20, height: AppSize.s12),
                          DropdownButton(
                            isDense: false,
                            icon: isright==true?
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0,),
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                size: AppSize.s33,
                              ),
                            ):  Padding(
                              padding: const EdgeInsets.only(right: 10,),
                              child: Icon(
                                Icons.arrow_drop_down_sharp,
                                size: AppSize.s33,
                              )),
                            iconEnabledColor: ColorsManger.primary,
                            itemHeight: mq.height * 0.081,
                            hint: Text(
                              "0",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            dropdownColor: Colors.white,
                            value: selectedChildNum,
                            items: passenger_num
                                .map((e) => DropdownMenuItem(
                                      child:isright==true?
                                      Padding(
                                        padding: const EdgeInsets.only(left: 78.0),
                                        child: Text(
                                          " $e",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ):  Padding(
                                        padding: const EdgeInsets.only(right: 58.0),
                                        child: Text(
                                          " $e",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                      ),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedChildNum = value;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isEconnomyClicked = !isEconnomyClicked;
                              });
                            },
                            child: Flexible(
                              child: Container(
                                height: mq.height * 0.054,
                                width: mq.width * 0.27,
                                decoration: BoxDecoration(
                                    color: isEconnomyClicked
                                        ? ColorsManger.primary
                                        : ColorsManger.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 2, color: ColorsManger.primary)),
                                child: Center(
                                  child: Text(
                                    translation(context).econnomy,
                                    style: isEconnomyClicked
                                        ? Theme.of(context).textTheme.bodyMedium
                                        : Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isBusinessClicked = !isBusinessClicked;
                              });
                            },
                            child: Flexible(
                              child: Container(
                                height: mq.height * 0.054,
                                width: mq.width * 0.253,
                                decoration: BoxDecoration(
                                    color: isBusinessClicked
                                        ? ColorsManger.primary
                                        : ColorsManger.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 2, color: ColorsManger.primary)),
                                child: Center(
                                  child: Text(
                                    translation(context).business,
                                    style: isBusinessClicked
                                        ? Theme.of(context).textTheme.bodyMedium
                                        : Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isFirstClicked = !isFirstClicked;
                              });
                            },
                            child: Flexible(
                              child: Container(
                                height: mq.height * 0.054,
                                width: mq.width * 0.28,
                                decoration: BoxDecoration(
                                    color:isFirstClicked
                                        ? ColorsManger.primary
                                        : ColorsManger.white,
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                        width: 2, color: ColorsManger.primary)),
                                child: Center(
                                  child: Text(
                                    translation(context).firstclass,
                                    style:isFirstClicked
                                        ? Theme.of(context).textTheme.bodyMedium:Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                    //  height: mq.height * 0.45,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p16,
                    top: AppPadding.p12,
                    right: AppPadding.p16,
                    bottom: AppPadding.p12),
                child: ElevatedButton(
                  onPressed: () {
                    if (to_Controller.text
                        .isEmpty ||
                        from_Controller.text ==
                            null||date_Controller.text.isEmpty &&
                            to_Controller.text
                                .isEmpty ||
                        from_Controller.text ==
                            null||date_Controller.text==null) {


                     _submit();
                    }
                     else{
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchFlightResult(to: to_Controller.text,
                       from: from_Controller.text, flight_way:selectedTab(AppString.tab_bar1)


                       , flight_date: date_Controller.text, flight_type: '',)));
                    }
                  },
                  child: Text(translation(context).searchflight,
                      style: Theme.of(context).textTheme.bodyMedium),
                  style: ElevatedButtonTheme.of(context).style,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                translation(context).bestvalueofferstoAsia,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            )
          ],
        ),
      ),
    ));
  }
     selectedTab(String tabBarName) {
      switch (tabBarName) {
        case AppString.tab_bar1:
          return AppString.tab_bar1;
        case AppString.tab_bar2:
          return AppString.tab_bar2;
          case AppString.tab_bar3:
          return AppString.tab_bar3;

        default:
          return AppString.tab_bar1;
      }
    }
  }

