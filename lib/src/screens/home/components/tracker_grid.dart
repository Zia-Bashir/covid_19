import 'package:covid_19/src/models/tracker_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackerGrid extends StatelessWidget {
  const TrackerGrid({
    Key? key,
    required this.style,
    required this.index,
    required this.data,
  }) : super(key: key);

  final TextTheme style;
  final int index;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
        horizontal: 15.w,
      ),
      decoration: BoxDecoration(
          color: trackerModel[index].bgColor,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                trackerModel[index].title,
                style: style.subtitle1?.copyWith(
                  color: trackerModel[index].textColor,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                data,
                style: style.subtitle1?.copyWith(
                    overflow: TextOverflow.fade,
                    color: trackerModel[index].textColor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}
