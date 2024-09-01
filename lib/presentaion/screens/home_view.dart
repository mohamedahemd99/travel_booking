import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking/helpers/custom_colors.dart';
import 'package:travel_booking/presentaion/provider/flight_provider.dart';
import 'package:travel_booking/presentaion/screens/result_view.dart';
import 'package:travel_booking/presentaion/screens/search_view.dart';

import '../widgets/bottom_navigation_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundAppColor,
      body: SafeArea(
          child: Provider.of<FlightProvider>(context).isResultScreen
              ? const ResultView()
              : const SearchView()),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
