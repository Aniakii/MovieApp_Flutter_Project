import 'package:flutter/material.dart';
import 'package:movie_app/constants/all_movies_screen.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text( headerTitle,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 5.0,),
          Text( headerDesc,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
