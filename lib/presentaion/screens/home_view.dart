import 'package:flutter/material.dart';
import 'package:travel_booking/helpers/custom_colors.dart';
import 'package:travel_booking/presentaion/widgets/header_widget.dart';

import '../widgets/bottom_navigation_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColors.backgroundAppColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [HeaderWidget()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
