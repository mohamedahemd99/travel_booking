import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/booking_card_widget.dart';
import '../widgets/header_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const HeaderWidget(),
        Positioned(
          top: 280.h, // Adjust this value as needed
          left: 16.0.w, // Adjust padding as needed
          right: 16.0.w,
          child: const BookingCard(),
        ),
      ],
    );
  }
}
