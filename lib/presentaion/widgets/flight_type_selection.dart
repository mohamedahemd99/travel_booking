import 'package:flutter/material.dart';
import 'package:travel_booking/helpers/app_text_styles.dart';
import 'package:travel_booking/helpers/utils.dart';

import '../../data/models/flight_type_enum.dart';
import '../../helpers/application_localization.dart';

class FlightTypeSelection extends StatefulWidget {
  const FlightTypeSelection({super.key});

  @override
  _FlightTypeSelectionState createState() => _FlightTypeSelectionState();
}

class _FlightTypeSelectionState extends State<FlightTypeSelection> {
  final String _selectedFlightType = FlightType.roundTrip.name.tr;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTextButton(
            AppLocalizations.of(context)!.translate(FlightType.roundTrip.name)),
        _buildTextButton(
            AppLocalizations.of(context)!.translate(FlightType.oneWay.name)),
        _buildTextButton(
            AppLocalizations.of(context)!.translate(FlightType.multiCity.name)),
      ],
    );
  }

  Widget _buildTextButton(String text) {
    return TextButton(
      onPressed: () {
        // setState(() {
        //   _selectedFlightType = text;
        // });
      },
      child: Text(
        text,
        style: AppTextStyles.title2.copyWith(
          color: _selectedFlightType == text ? Colors.blue : Colors.grey[200],
        ),
      ),
    );
  }
}
