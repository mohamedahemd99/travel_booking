import 'package:flutter/material.dart';
import 'package:travel_booking/helpers/app_text_styles.dart';
import 'package:travel_booking/helpers/custom_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor, textColor, borderColor;
  final String? name;
  final bool isRadius;
  final TextStyle? textstyle;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    this.backgroundColor = CustomColors.secondaryColor,
    this.textColor,
    required this.name,
    this.isRadius = true,
    this.textstyle,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsetsDirectional.symmetric(horizontal: 2),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isRadius ? 2 : 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: FittedBox(
          child: Text(name!, style: textstyle ?? AppTextStyles.title1),
        ),
      ),
    );
  }
}
