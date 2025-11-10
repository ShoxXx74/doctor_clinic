import 'package:doctor_clinic/core/theming/colors.dart';
import 'package:doctor_clinic/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      ' خبرة 16 سنة \n أفضل رعاية صحية لك ولعائلتك ',
      style: TextStyles.font24Black700weight
          .copyWith(
            fontSize: 14.sp,
            fontFamily: 'Lemonada',
            height: 2.h,
            color: ColorsManager.grey,
          ),
      textAlign: TextAlign.center,
    );
  }
}
