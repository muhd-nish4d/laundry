import 'package:authentication/constants/colors.dart';
import 'package:flutter/material.dart';

class MoreWidthButton extends StatelessWidget {
  const MoreWidthButton({
    super.key,
    required this.text,
    this.onClick,
  });
  final String text;
  final void Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: getstartedButtonAndSignIn),
          onPressed: onClick,
          child: Text(
            text,
            style:
                const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
          )),
    );
  }
}
