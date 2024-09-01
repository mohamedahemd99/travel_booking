import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:travel_booking/helpers/app_text_styles.dart';
import 'package:travel_booking/helpers/custom_colors.dart';
import 'package:travel_booking/helpers/size_extension.dart';

import '../../data/models/flight_model.dart';
import '../../helpers/application_localization.dart';

class FlightTicketWidget extends StatelessWidget {
  const FlightTicketWidget({super.key, this.model});

  final Itinerary? model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TicketWidget(
          margin: const EdgeInsets.all(10),
          height: 183.h,
          width: double.infinity,
          isCornerRounded: true,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model!.legs[0].carriers.marketing[0].name,
                      style: AppTextStyles.title1
                          .copyWith(color: CustomColors.primaryColor),
                    ),
                    Image.network(
                      model!.legs[0].carriers.marketing[0].logoUrl,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.info_outline);
                      },
                    ),
                    Text(
                      model!.price.formatted,
                      style: AppTextStyles.h2_18
                          .copyWith(color: CustomColors.secondaryColor),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .translate("departureTime"),
                            style: AppTextStyles.body1
                                .copyWith(color: CustomColors.greyAppColor),
                          ),
                          Text(formatTime(model!.legs[0].arrival),
                              style: AppTextStyles.h2_20
                                  .copyWith(color: CustomColors.primaryColor)),
                        ],
                      ),
                    ),
                    Text("-------",
                        style: AppTextStyles.body1
                            .copyWith(color: CustomColors.greyAppColor)),
                    DottedBorder(
                      radius: const Radius.circular(20),
                      color: CustomColors.greyAppColor,
                      padding: const EdgeInsets.all(8),
                      borderType: BorderType.RRect,
                      child: Text(
                          formatDuration(model!.legs[0].durationInMinutes),
                          style: AppTextStyles.body1
                              .copyWith(color: CustomColors.greyAppColor)),
                    ),
                    Text("-------",
                        style: AppTextStyles.body1
                            .copyWith(color: CustomColors.greyAppColor)),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.translate("arrive"),
                            style: AppTextStyles.body1
                                .copyWith(color: CustomColors.greyAppColor),
                          ),
                          Text(formatTime(model!.legs[0].departure),
                              style: AppTextStyles.h2_20
                                  .copyWith(color: CustomColors.primaryColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(AppLocalizations.of(context)!.translate("viewMore"),
                    style: AppTextStyles.title2
                        .copyWith(color: CustomColors.primaryColor)),
              )
            ],
          )),
    );
  }
}

String formatDuration(int durationInMinutes) {
  final hours = durationInMinutes ~/ 60;
  final minutes = durationInMinutes % 60;
  return '${hours}H, ${minutes.toString().padLeft(2, '0')}M';
}

String formatTime(String timeString) {
  final dateTime = DateTime.parse(timeString);
  return DateFormat('HH:mm').format(dateTime);
}
