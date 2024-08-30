import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_booking/helpers/app_image_paths.dart';
import 'package:travel_booking/helpers/app_text_styles.dart';
import 'package:travel_booking/helpers/size_extension.dart';
import 'package:travel_booking/helpers/utils.dart';
import 'package:travel_booking/presentaion/widgets/flight_type_selection.dart';

import '../../helpers/custom_colors.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget(
      {super.key,
      this.isResultScreen = false,
      this.numberOfFlight,
      this.dep,
      this.arr});

  final bool isResultScreen;
  final String? numberOfFlight;
  final String? dep;
  final String? arr;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: 294.h,
          decoration: BoxDecoration(
              color: CustomColors.primaryColor,
              borderRadius: AppCorners.xl2gBottomBorder),
        ),
        Image.asset(
          AppImages.world,
          width: double.infinity,
          height: 250.h,
          fit: BoxFit.contain,
        ),
        Positioned(top: 30.h, child: Image.asset(AppImages.multiDestenation)),
        Positioned(
            top: 20.h,
            child: isResultScreen
                ? Text(
                    "searchResult".tr,
                    style: AppTextStyles.title1,
                  )
                : Image.asset(AppImages.logo)),
        Padding(
          padding: EdgeInsets.only(top: 130.h, right: 20.w, left: 20.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: isResultScreen
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.start,
                children: [
                  if (!isResultScreen)
                    Text(
                      "header".tr,
                      style: AppTextStyles.h1,
                    ),
                  if (isResultScreen)
                    Text(
                      "$dep",
                      style: AppTextStyles.h1,
                    ),
                  if (isResultScreen)
                    Text(
                      "$arr",
                      style: AppTextStyles.h1,
                    ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              if (!isResultScreen) const FlightTypeSelection()
            ],
          ),
        ),
        if (isResultScreen)
          Positioned(
            top: 250.h,
            child: Text(
              "$numberOfFlight ${"flightsAvailable".tr}",
              style: AppTextStyles.title2,
            ),
          )
      ],
    );
  }
}
