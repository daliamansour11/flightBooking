import 'package:flightbooking/core/resources/assets_manger.dart';
import 'package:flightbooking/core/resources/colors_manger.dart';
import 'package:flightbooking/core/resources/strings_manger.dart';
import 'package:flightbooking/core/resources/values_manger.dart';
import 'package:flightbooking/main.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../core/resources/translations/languages/language_constants.dart';

class SearchFlightResult extends StatefulWidget {
  final String from;
  final String to;
  final String flight_way;
  final String flight_date;
  final String flight_type;

  const SearchFlightResult({
    required this.to,
    required this.from,
    required this.flight_way,
    required this.flight_date,
    required this.flight_type,
  });

  @override
  State<SearchFlightResult> createState() => _SearchFlightResultState();
}

class _SearchFlightResultState extends State<SearchFlightResult> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: ColorsManger.white,
            appBar: _appBar(context),
            body: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "12",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 170.0),
                        child: Text(
                          translation(context).availableflight,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Icon(
                          Icons.filter_alt_outlined,
                          size: 38,
                          color: ColorsManger.semiLightGreyColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10, top: 10, bottom: 20),
                            child: Container(
                              height: mq.height * 0.18,
                              child: DottedBorder(
                                dashPattern: [
                                  5,
                                  4,
                                ],
                                strokeCap: StrokeCap.round,
                                strokeWidth: 1,
                                borderType: BorderType.RRect,
                                radius: Radius.circular(20),
                                padding: EdgeInsets.all(15),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Flexible(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "In 899",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                ),
                                                Text(
                                                  "2hr 15 min",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium,
                                                ),
                                                Text(
                                                  "0 STOP",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelLarge,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "12:15",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                              SizedBox(
                                                  width: 100,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                          child: getDottedLine),
                                                      Positioned(
                                                          left: 60,
                                                          right: 60,
                                                          child: Icon(
                                                            Icons
                                                                .airplanemode_active_outlined,
                                                            color: ColorsManger
                                                                .primary,
                                                            size: 36,
                                                          ))
                                                    ],
                                                  )),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 56.0),
                                                child: Text(
                                                  "14:30",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    )
                                    //  height: mq.height * 0.45,
                                    ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: mq.width * 0.08,
                            right: mq.width * 0.08,
                            child: Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: AppPadding.p16,
                                  top: AppPadding.p12,
                                  right: AppPadding.p16,
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchFlightResult(to: to_Controller.text, from: from_Controller.text, flight_way: '', flight_date: date_Controller.text, flight_type: '',)));
                                  },
                                  child: Text(translation(context).bookflight,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium),
                                  style: ElevatedButtonTheme.of(context).style,
                                ),
                              ),
                            ),
                          ),
                        ]);
                      },

                      //   )
                      // ],
                    ),
                  ),
                ],
              ),
            )));
  }

  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
        child: Container(
          decoration: BoxDecoration(
            color: ColorsManger.primary,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              _topBar(context),
              // _tabBar(context),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(mq.height * 0.22));
  }

  Widget _topBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p36),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorsManger.white,
                  size: 36,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 68.0),
                child: Text(
                  translation(context).searchresult,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "AMD",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                    width: 100,
                    child: Stack(
                      children: [
                        Positioned(child: fullWidthPath),
                        Positioned(
                            left: 60,
                            right: 50,
                            child: Icon(
                              Icons.airplanemode_active_outlined,
                              color: ColorsManger.white,
                              size: 36,
                            ))
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 36.0),
                  child: Text(
                    "AMD",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.from,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 36.0),
                  child: Text(widget.to,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.flight_way,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  widget.flight_date,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  widget.flight_type,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget _tabBar(BuildContext context) {
  //   return Padding(
  //       padding: const EdgeInsets.only(top: 44.0, left: 8, right: 8),
  //       child: TabBar(
  //           unselectedLabelColor: ColorsManger.semiLightGreyColor,
  //           labelColor: ColorsManger.primary,
  //           indicator: BoxDecoration(
  //             borderRadius: BorderRadius.circular(30),
  //             color: Colors.white,
  //           ),
  //           tabs: [
  //             Center(
  //                 child: Text(
  //                   AppString.tab_bar1,
  //                   style: TextStyle(fontSize: AppSize.s16),
  //                 )),
  //             Center(
  //                 child: Text(AppString.tab_bar2,
  //                     style: TextStyle(fontSize: AppSize.s16))),
  //             Center(
  //                 child: Text(AppString.tab_bar3,
  //                     style: TextStyle(fontSize: AppSize.s16))),
  //           ]
  //       )
  //   );
  Widget get fullWidthPath {
    return DottedBorder(
        dashPattern: [
          4,
          4,
        ],
        strokeWidth: 2,
        color: ColorsManger.white,
        customPath: (size) {
          return Path()
            ..moveTo(0, 20)
            ..lineTo(size.width * 1.6, 20);
        },
        child:
            Padding(padding: const EdgeInsets.all(16.0), child: Container()));
  }

  Widget get getDottedLine {
    return DottedBorder(
        dashPattern: [
          4,
          4,
        ],
        color: ColorsManger.primary,
        strokeWidth: 2,
        customPath: (size) {
          return Path()
            ..moveTo(10, 20)
            ..lineTo(size.width * 1.6, 20);
        },
        child:
            Padding(padding: const EdgeInsets.all(16.0), child: Container()));
  }
}
