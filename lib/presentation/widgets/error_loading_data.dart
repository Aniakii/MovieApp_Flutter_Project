import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants/color_palette.dart';

class ErrorLoadingDataWidget extends StatelessWidget {
  const ErrorLoadingDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkerPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              color: AppColors.brighterPurple,
              size: 100.0,
            ),
            const SizedBox(
              height: 50.0,
            ),
            Text(
              S.of(context)!.failedText,
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
