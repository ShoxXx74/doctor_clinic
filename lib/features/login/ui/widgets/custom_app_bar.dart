import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 120.h,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(
          top: 30.0,
          bottom: 10.0,
        ),
        child: Image.asset(
          'assets/images/app_logo.png',
          filterQuality: FilterQuality.high,
          height: 140.h,
          width: 260.w,
        ),
      ),
    );
  }
}
