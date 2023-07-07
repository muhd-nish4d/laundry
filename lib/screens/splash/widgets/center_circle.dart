import 'package:flutter/material.dart';

class CentreCircleWidget extends StatelessWidget {
  const CentreCircleWidget({
    super.key,
    required this.size,
    required this.opacity,
  });
  final double size;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(opacity),
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
