import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_booking/helpers/app_text_styles.dart';

import '../provider/app_language_provider.dart';

class LanguageButton extends StatefulWidget {
  const LanguageButton({Key? key}) : super(key: key);

  @override
  State<LanguageButton> createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AppLanguageProvider>(context, listen: false)
            .toggleAppLanguage(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(AppLanguageProvider.of(context).appLocal.languageCode,
            style: AppTextStyles.h2_20),
      ),
    );
  }
}
