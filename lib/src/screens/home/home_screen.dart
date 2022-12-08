import 'package:covid_19/src/controllers/api_controller.dart';
import 'package:covid_19/src/models/covid_all_model.dart';
import 'package:covid_19/src/models/tracker_model.dart';
import 'package:covid_19/src/screens/search/search_country_screen.dart';
import 'package:covid_19/src/utils/app_colors.dart';
import 'package:covid_19/src/utils/app_images.dart';
import 'package:covid_19/src/utils/app_text.dart';
import 'package:covid_19/src/widget/prevention_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController controller = Get.find();
    var style = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: 896.h,
          width: 414.w,
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* -- AppBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(profileImage),
                            fit: BoxFit.contain),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SearchCountryScreen());
                      },
                      child: Icon(
                        Icons.search,
                        color: AppColors.color1,
                        size: 30.sp,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),

                //* -- Banner
                SizedBox(
                  width: 378,
                  child: SvgPicture.asset(
                    newHomeBanner,
                    fit: BoxFit.cover,
                  ),
                ),

                //* -- Tab Bar
                Container(
                  height: 50.h,
                  width: 378.w,
                  margin: EdgeInsets.only(top: 25.h),
                  padding: EdgeInsets.symmetric(
                    vertical: 5.h,
                    horizontal: 5.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.color1,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: TabBar(
                      unselectedLabelStyle: style.subtitle1,
                      unselectedLabelColor: const Color(0xffA74813),
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r)),
                      tabs: const [
                        Tab(
                          text: "Tracker",
                        ),
                        Tab(
                          text: "Symptoms",
                        ),
                      ]),
                ),
                Container(
                  height: 360.h,
                  width: 378.w,
                  padding: EdgeInsets.symmetric(
                    vertical: 40.h,
                  ),
                  child: TabBarView(children: [
                    //* -- Tracker
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1.36,
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder(
                          future: controller.getGlobal(),
                          builder: (BuildContext context,
                              AsyncSnapshot<CovidAllModel> snapshot) {
                            List data = [
                              snapshot.data!.active.toString(),
                              snapshot.data!.todayDeaths.toString(),
                              snapshot.data!.todayCases.toString(),
                              snapshot.data!.deaths.toString(),
                            ];

                            return Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 15.h,
                                horizontal: 15.w,
                              ),
                              decoration: BoxDecoration(
                                  color: trackerModel[index].bgColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: snapshot.connectionState ==
                                      ConnectionState.done
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              trackerModel[index].title,
                                              style: style.subtitle1?.copyWith(
                                                color: trackerModel[index]
                                                    .textColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(
                                              data[index] ?? "0",
                                              style: style.subtitle1?.copyWith(
                                                  overflow: TextOverflow.fade,
                                                  color: trackerModel[index]
                                                      .textColor,
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  : const CircularProgressIndicator(),
                            );
                          },
                        );
                      },
                    ),
                    // FutureBuilder(
                    //         future: controller.getGlobal(),
                    //         builder: (BuildContext context,
                    //             AsyncSnapshot<CovidAllModel> snapshot) {
                    //           List data = [
                    //             snapshot.data!.active.toString(),
                    //             snapshot.data!.todayDeaths.toString(),
                    //             snapshot.data!.todayCases.toString(),
                    //             snapshot.data!.deaths.toString(),
                    //           ];
                    //           if (snapshot.connectionState ==
                    //               ConnectionState.done) {
                    //             if (snapshot.hasError) {
                    //               return const Center(
                    //                   child: CircularProgressIndicator());

                    //               // if we got our data
                    //             } else if (snapshot.hasData) {
                    //               return GridView.builder(
                    //                 gridDelegate:
                    //                     const SliverGridDelegateWithFixedCrossAxisCount(
                    //                         childAspectRatio: 1.36,
                    //                         crossAxisCount: 2,
                    //                         mainAxisSpacing: 20,
                    //                         crossAxisSpacing: 20),
                    //                 itemCount: 4,
                    //                 itemBuilder:
                    //                     (BuildContext context, int index) {
                    //                   return TrackerGrid(
                    //                     style: style,
                    //                     index: index,
                    //                     data: data[index],
                    //                   );
                    //                 },
                    //               );
                    //             }
                    //           } else {
                    //             throw Exception("error");
                    //           }
                    //           return const Center(
                    //             child: CircularProgressIndicator(),
                    //           );
                    //         },
                    //       ),

                    //* -- Symptoms
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          "Most Common Symptoms:",
                          style: style.subtitle2?.copyWith(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          ". Fever\n. Cough\n. Tiredness\n. Loss of Taste & Smell",
                          style: style.subtitle2
                              ?.copyWith(color: AppColors.color1),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Less Common Symptoms:",
                          style: style.subtitle2?.copyWith(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          ". Sore Throat\n. Headache\n. Aches & Pains\n. Diarrhoea\n. Red or Irritated Eyes",
                          style: style.subtitle2
                              ?.copyWith(color: AppColors.color1),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Serious Symptoms:",
                          style: style.subtitle2?.copyWith(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          ". Difficulty Breathing or Shortness of Breath\n. Loss of Speech, Mobility or Confusion\n. Chest Pain",
                          style: style.subtitle2
                              ?.copyWith(color: AppColors.color1),
                        ),
                      ],
                    ),
                  ]),
                ),

                //* -- Prevations
                Container(
                  width: 424.w,
                  height: 190.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        tPreventions,
                        style: style.headline1?.copyWith(
                            fontSize: 20.sp, fontWeight: FontWeight.w800),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrevationIconsWidget(
                            style: style,
                            imgURL: handIcon,
                            text: tWash,
                          ),
                          PrevationIconsWidget(
                            style: style,
                            imgURL: maskIcon,
                            text: tMask,
                          ),
                          PrevationIconsWidget(
                            style: style,
                            imgURL: cleanIcon,
                            text: tClean,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
