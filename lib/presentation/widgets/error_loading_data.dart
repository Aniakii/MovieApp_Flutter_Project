import 'package:flutter/material.dart';

import '../../constants/color_palette.dart';
import '../../constants/texts.dart';

class ErrorLoadingDataWidget extends StatelessWidget {
  const ErrorLoadingDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkerPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: AppColors.brighterPurple,
              size: 100.0,
            ),
            SizedBox(height: 50.0),
            Text(LoadingTexts.failedText, style: TextStyle(fontSize: 30.0)),
          ],
        ),
      ),
    );
  }
}
