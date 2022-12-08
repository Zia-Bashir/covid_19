import 'package:covid_19/src/controllers/api_controller.dart';
import 'package:covid_19/src/utils/app_colors.dart';
import 'package:covid_19/src/widget/textfiled_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchCountryScreen extends StatefulWidget {
  const SearchCountryScreen({super.key});

  @override
  State<SearchCountryScreen> createState() => _SearchCountryScreenState();
}

class _SearchCountryScreenState extends State<SearchCountryScreen> {
  var searchController = TextEditingController();
  ApiController controller = Get.find();
  @override
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFieldWidget(
                    controller: searchController,
                    hintText: "Search here",
                    icon: Icons.search,
                    lable: "Search",
                    onchanged: (value) {
                      setState(() {
                        print(value);
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.getCountry(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Center(child: CircularProgressIndicator());

                      // if we got our data
                    } else {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            String name = snapshot.data![index]['country'];
                            if (searchController.text.isEmpty) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        snapshot.data![index]['country'],
                                        style: style.headline1
                                            ?.copyWith(fontSize: 20.sp),
                                      ),
                                      subtitle: Text(
                                        "${snapshot.data![index]['cases'].toString()} Cases",
                                        style: style.subtitle2?.copyWith(
                                            color: AppColors.color5,
                                            fontSize: 14.sp),
                                      ),
                                      leading: Image(
                                          height: 50.h,
                                          width: 50.w,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  ],
                                ),
                              );
                            } else if (name.toLowerCase().contains(
                                searchController.text.toLowerCase())) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  right: 10.w,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      title: Text(
                                        snapshot.data![index]['country'],
                                        style: style.headline1
                                            ?.copyWith(fontSize: 20.sp),
                                      ),
                                      subtitle: Text(
                                        "${snapshot.data![index]['cases'].toString()} Cases",
                                        style: style.subtitle2?.copyWith(
                                            color: AppColors.color5,
                                            fontSize: 14.sp),
                                      ),
                                      leading: Image(
                                          height: 50.h,
                                          width: 50.w,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        );
                      }
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
