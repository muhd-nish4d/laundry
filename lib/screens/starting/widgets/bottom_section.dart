import 'package:authentication/screens/authentication/phone_number/entering_phone_number.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../widgets/widthed_buttons.dart';

/*
In this file => 
Get started button its navigate phone number entering screen (ScreenPhoneNumber())
and the bottum texts ("Already have an accout")
*/

class BottumSection extends StatelessWidget {
  const BottumSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(),
        MoreWidthButton(
            text: 'Get Started',
            onClick: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScreenPhoneNumber()))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: thisPageText(color: Colors.white),
            ),
            const SizedBox(width: 5),
            Text(
              'Sign In',
              style: thisPageText(color: getstartedButtonAndSignIn),
            )
          ],
        )
      ],
    );
  }

  TextStyle thisPageText({required Color color}) {
    TextStyle style =
        TextStyle(color: color, fontWeight: FontWeight.bold, letterSpacing: 1);
    return style;
  }
}
