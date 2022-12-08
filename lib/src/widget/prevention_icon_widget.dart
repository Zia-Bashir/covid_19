import 'package:covid_19/src/utils/app_colors.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrevationIconsWidget extends StatelessWidget {
  const PrevationIconsWidget({
    Key? key,
    required this.style,
    required this.text,
    required this.imgURL,
  }) : super(key: key);

  final TextTheme style;
  final String text;
  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 30.h),
          height: 70.h,
          width: 70.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(imgURL))),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          text,
          style: style.subtitle1
              ?.copyWith(color: const Color.fromARGB(255, 216, 95, 30)),
        ),
      ],
    );
  }
}
