import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking/helpers/size_extension.dart';
import 'package:travel_booking/presentaion/provider/flight_provider.dart';
import 'package:travel_booking/presentaion/widgets/flight_ticket_widget.dart';

import '../widgets/header_widget.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<FlightProvider>(context);
    return Column(
      children: [
        HeaderWidget(
          isResultScreen: true,
          dep: prov.depId,
          arr: prov.arrId,
          numberOfFlight: prov.flights!.data.itineraries.length.toString(),
        ),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => FlightTicketWidget(
                    model: Provider.of<FlightProvider>(context)
                        .flights!
                        .data
                        .itineraries[index],
                  ),
              separatorBuilder: (context, index) => SizedBox(height: 20.h),
              itemCount: Provider.of<FlightProvider>(context)
                  .flights!
                  .data
                  .itineraries
                  .length),
        ),
      ],
    );
  }
}
