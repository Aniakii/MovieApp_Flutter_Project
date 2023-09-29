import 'package:flutter/material.dart';

import '../../constants/texts.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppTexts.headerTitle,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            AppTexts.headerDesc,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
