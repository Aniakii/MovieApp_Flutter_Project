import 'package:flutter/material.dart';
import 'package:movie_app/constants/enums.dart';

class SortMenuItem extends StatelessWidget {

  SortMenuItem({required this.icon, required this.sortingType, required this.description});

  final Icon icon;
  final SortingType sortingType;
  final String description;

  @override
  Widget build(BuildContext context) {
    return PopupMenuItem<SortingType>(
      value: sortingType,
      child: Row(
        children: [
          icon,
          SizedBox(width: 8.0),
          Text(description),
        ],
      ),
    );
  }
}
