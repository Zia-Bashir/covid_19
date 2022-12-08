import 'package:covid_19/src/screens/home/home_screen.dart';
import 'package:covid_19/src/utils/app_colors.dart';
import 'package:covid_19/src/utils/app_images.dart';
import 'package:covid_19/src/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.color6,
      body: SizedBox(
        height: 896.h,
        width: 414.w,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 597.h,
                width: 414.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(splashImage), fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 310.h,
                width: 414.w,
                padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 35.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35.r),
                        topRight: Radius.circular(35.r))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tSplashTitle,
                          style: style.headline1,
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          tSplashSubTitle,
                          style: style.subtitle2,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "GET Staeted".toUpperCase(),
                          style: style.subtitle1?.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAll(() => const HomeScreen());
                          },
                          child: Container(
                            height: 50.h,
                            width: 50.w,
                            margin: EdgeInsets.only(left: 20.w),
                            decoration: const BoxDecoration(
                                color: AppColors.color1,
                                shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
