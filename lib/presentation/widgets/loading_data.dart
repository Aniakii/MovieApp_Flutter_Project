import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constants/color_palette.dart';
import '../../constants/texts.dart';

class LoadingDataWidget extends StatelessWidget {
  const LoadingDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkerPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitFadingCircle(
              color: AppColors.brighterPurple,
              size: 100.0,
            ),
            const SizedBox(height: 50.0),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 20.0),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(LoadingTexts.loadingText1,
                      textStyle: const TextStyle(fontSize: 30.0)),
                  TypewriterAnimatedText(LoadingTexts.loadingText2,
                      textStyle: const TextStyle(fontSize: 30.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
