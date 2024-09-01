import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking/helpers/app_image_paths.dart';
import 'package:travel_booking/helpers/utils.dart';
import 'package:travel_booking/presentaion/widgets/app_button_widget.dart';

import '../../data/models/flight_type_enum.dart';
import '../provider/flight_provider.dart';

class BookingCard extends StatefulWidget {
  const BookingCard({super.key});

  @override
  _BookingCardState createState() => _BookingCardState();
}

class _BookingCardState extends State<BookingCard> {
  final List<String> _travelersOptions = ['1', '2', '3', '4', '5+'];
  final List<String> _classOptions = ['Economy', 'Business', 'First Class'];

  @override
  Widget build(BuildContext context) {
    final flightProvider = Provider.of<FlightProvider>(context);

    return SizedBox(
      height: 400.h,
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: _buildAutocompleteField(
                        label: 'from'.tr,
                        onChanged: (value) =>
                            flightProvider.setSelectedFrom(value)),
                  ),
                  InkWell(
                      onTap: () => flightProvider.swapFromTo(),
                      child: Image.asset(AppImages.change)),
                  Expanded(
                    child: _buildAutocompleteField(
                        label: 'to'.tr,
                        onChanged: (value) =>
                            flightProvider.setSelectedTo(value)),
                  ),
                  SizedBox(height: 16.0.h),
                  Expanded(child: _buildDateRangeField()),
                  SizedBox(height: 16.0.h),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildDropdownField(
                            label: 'travellers'.tr,
                            value: flightProvider.selectedTravelers,
                            items: _travelersOptions,
                            onChanged: (value) =>
                                flightProvider.setTraveller(value),
                          ),
                        ),
                        SizedBox(width: 16.0.w),
                        Expanded(
                          child: _buildDropdownField(
                            label: 'class'.tr,
                            value: flightProvider.selectedClass,
                            items: _classOptions,
                            onChanged: (value) =>
                                flightProvider.setClass(value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Expanded(
                    child: CustomButtonWidget(
                        onPressed: () {
                          if (flightProvider.depId != null &&
                              flightProvider.arrId != null &&
                              flightProvider.selectedDateRange != null &&
                              flightProvider.selectedClass != null &&
                              flightProvider.selectedTravelers != null) {
                            flightProvider.searchFlights();
                          } else {
                            // Show an error message if the cities are not selected
                            if (kDebugMode) {
                              print("Please select both cities");
                            }
                          }
                        },
                        name: "searchFlights".tr),
                  )
                ],
              ),
              Positioned(
                  top: 30,
                  child: Image.asset(
                    AppImages.desArr,
                    height: 100.h,
                    fit: BoxFit.contain,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      onChanged: onChanged,
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: FittedBox(child: Text(item)),
        );
      }).toList(),
    );
  }

  Widget _buildAutocompleteField({
    required String label,
    String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return cities.where((city) =>
            city.toLowerCase().contains(textEditingValue.text.toLowerCase()));
      },
      onSelected: (selectedCity) {
        onChanged(selectedCity);
      },
      fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(),
            hintText: value ?? 'Select $label',
          ),
        );
      },
    );
  }

  Widget _buildDateRangeField() {
    return TextFormField(
      readOnly: true,
      onTap: () async {
        DateTimeRange? picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          Provider.of<FlightProvider>(context, listen: false)
              .setDatePicker(picked);
        }
      },
      decoration: InputDecoration(
        labelText: 'date'.tr,
        border: const OutlineInputBorder(),
        hintText: Provider.of<FlightProvider>(context).selectedDateRange == null
            ? 'Select Date Range'
            : '${DateFormat('yyyy-MM-dd').format(Provider.of<FlightProvider>(context).selectedDateRange!.start)} - ${DateFormat('yyyy-MM-dd').format(Provider.of<FlightProvider>(context).selectedDateRange!.end)}',
      ),
    );
  }
}
