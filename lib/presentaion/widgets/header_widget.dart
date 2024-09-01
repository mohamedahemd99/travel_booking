import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking/helpers/app_image_paths.dart';
import 'package:travel_booking/helpers/app_text_styles.dart';
import 'package:travel_booking/helpers/application_localization.dart';
import 'package:travel_booking/helpers/size_extension.dart';
import 'package:travel_booking/presentaion/provider/flight_provider.dart';
import 'package:travel_booking/presentaion/widgets/flight_type_selection.dart';
import 'package:travel_booking/presentaion/widgets/language_buttom.dart';

import '../../helpers/custom_colors.dart';
import '../provider/app_language_provider.dart';

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
        if (isResultScreen)
          Positioned(
              top: 20.h,
              left: !Provider.of<AppLanguageProvider>(context).isArabic
                  ? 20
                  : MediaQuery.of(context).size.width - 60,
              child: InkWell(
                onTap: () => Provider.of<FlightProvider>(context, listen: false)
                    .getBack(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: CustomColors.whiteColor,
                ),
              )),
        Positioned(
            top: 20.h,
            right: !Provider.of<AppLanguageProvider>(context).isArabic
                ? 20
                : MediaQuery.of(context).size.width - 60,
            child: const LanguageButton()),
        Positioned(
            top: 20.h,
            child: isResultScreen
                ? Text(
                    AppLocalizations.of(context)!.translate("searchResult"),
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
                      AppLocalizations.of(context)!.translate("header"),
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
              "$numberOfFlight ${AppLocalizations.of(context)!.translate("flightsAvailable")}",
              style: AppTextStyles.title2,
            ),
          )
      ],
    );
  }
}
