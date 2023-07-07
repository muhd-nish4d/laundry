import 'package:authentication/constants/colors.dart';
import 'package:flutter/material.dart';

/* 
In this file =>
Center smiling man's image and its background containers
*/

class ManContainer extends StatelessWidget {
  const ManContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 270,
          width: 160,
          decoration: BoxDecoration(
              color: manBackgroundContainer,
              borderRadius: BorderRadius.circular(100)),
        ),
        Container(
          height: 320,
          width: 160,
          decoration: BoxDecoration(
            image: const DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/images/man.png')),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ],
    );
  }
}
