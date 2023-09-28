import 'package:flutter/material.dart';
import 'package:movie_app/constants/color_palette.dart';

class GenreSelector extends StatelessWidget {

GenreSelector({required this.name, required this.id, required this.isSelected, required this.chooseGenre});

bool isSelected;
final String name;
final int id;
final void Function() chooseGenre;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chooseGenre,
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(5.0),
        width: 90.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? brighterPurple : darkerPurple,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(5, 3),
            ),
          ],
        ),
        child: Center(
         child:
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
