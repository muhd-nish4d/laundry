import 'package:authentication/screens/starting/widgets/bottom_section.dart';
import 'package:authentication/screens/starting/widgets/centre_man.dart';
import 'package:authentication/screens/starting/widgets/loundry_tokens.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ScreenGetStarted extends StatelessWidget {
  const ScreenGetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: screenSize.width,
            height: screenSize.height * .5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: const [
                LaundryTokenFullList(
                    textColor: textGrey,
                    tokenColor: greyGreen,
                    bottom: 50,
                    left: -30,
                    angle: 12),
                ManContainer(),
                LaundryTokenFullList(
                    textColor: Colors.white,
                    tokenColor: greyBlue,
                    bottom: 50,
                    left: -30,
                    angle: -12),
              ],
            ),
          ),
          const Expanded(
            child: BottumSection(),
          ),
        ],
      ),
    );
  }
}
