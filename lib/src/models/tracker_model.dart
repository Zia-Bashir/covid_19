import 'package:flutter/animation.dart';
import 'package:covid_19/src/utils/app_colors.dart';
import 'package:covid_19/src/utils/app_text.dart';

class TrackerModel {
  final String title;
  final Color bgColor;
  final Color textColor;

  TrackerModel({
    required this.title,
    required this.bgColor,
    required this.textColor,
  });
}

List<TrackerModel> trackerModel = [
  TrackerModel(
    title: tCOnfirmed,
    bgColor: AppColors.color2.withOpacity(0.1),
    textColor: AppColors.color2,
  ),
  TrackerModel(
    title: tDeath,
    bgColor: AppColors.color3.withOpacity(0.1),
    textColor: AppColors.color3,
  ),
  TrackerModel(
    title: tLatest,
    bgColor: AppColors.color4.withOpacity(0.1),
    textColor: AppColors.color4,
  ),
  TrackerModel(
    title: tTotal,
    bgColor: AppColors.color5.withOpacity(0.1),
    textColor: AppColors.color5,
  ),
];
