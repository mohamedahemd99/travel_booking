import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking/helpers/custom_colors.dart';
import 'package:travel_booking/helpers/size_extension.dart';
import 'package:travel_booking/helpers/utils.dart';

import '../../helpers/app_image_paths.dart';
import '../../helpers/app_text_styles.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleNavBar(
      activeIndex: 1,

      activeIcons: [
        Image.asset(AppImages.home),
        Image.asset(AppImages.plane),
        Image.asset(AppImages.search),
      ],
      inactiveIcons: [
        Column(
          children: [
            Image.asset(AppImages.home),
            Text(
              "home".tr,
              style: AppTextStyles.body1,
            )
          ],
        ),
        Image.asset(AppImages.plane),
        Column(
          children: [
            Image.asset(AppImages.search),
            Text(
              "search".tr,
              style: AppTextStyles.body1,
            )
          ],
        ),
      ],
      color: Colors.white,
      circleColor: Colors.white,
      height: 70.h,
      circleWidth: 60,

      // tabCurve: ,
      // padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      elevation: 10,

      gradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [CustomColors.primaryColor, CustomColors.primaryColor],
      ),
      circleGradient: const LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [CustomColors.primaryColor, CustomColors.primaryColor],
      ),
    );
  }
}
