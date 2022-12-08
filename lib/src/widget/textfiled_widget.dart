import 'package:covid_19/src/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.color = AppColors.color1,
    required this.lable,
    this.obsureText = false,
    this.keyboard,
    this.onchanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Color color;
  final String lable;
  final bool? obsureText;
  final TextInputType? keyboard;
  final Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: TextFormField(
            keyboardType: keyboard,
            controller: controller,
            obscureText: obsureText!,
            onChanged: onchanged,
            decoration: InputDecoration(
                hintText: hintText,
                label: Text(lable),
                suffixIcon: Icon(icon),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.color1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.color1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.color1),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.color1),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(28.r),
                  borderSide:
                      const BorderSide(width: 2, color: AppColors.color1),
                ),
                errorStyle: Theme.of(context)
                    .textTheme
                    .subtitle1
                    ?.copyWith(color: AppColors.color1)),
          ),
        ),
        SizedBox(
          height: 30.h,
        )
      ],
    );
  }
}
