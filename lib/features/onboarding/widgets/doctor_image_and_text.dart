import 'package:doctor_clinic/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Add your image and text widgets here
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.white,
                Colors.white.withValues(
                  alpha: 0.0,
                ),
              ],
              stops: const [0.10, 0.4],
            ),
          ),
          child: Image.asset(
            'assets/images/doctor.png',
            height: 400.h,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
        Positioned(
          bottom: 5,
          left: 0.w,
          right: 0.w,
          child: Text(
            '  للعلاج الطبيعي \n والتغذية العلاجية ',
            style: TextStyles.font32BlueBold
                .copyWith(
                  height: 1.6.h,
                  fontSize: 28.sp,
                  fontFamily: 'Lemonada',
                ),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
    );
  }
}
