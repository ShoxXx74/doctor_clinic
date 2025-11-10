import 'package:doctor_clinic/core/helpers/extentions.dart';
import 'package:doctor_clinic/core/routing/routes.dart';
import 'package:doctor_clinic/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: TextButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,
        fixedSize: Size(200.w, 50.h),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            50.r,
          ),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontFamily: 'Lemonada',
        ),
      ),
    );
  }
}
