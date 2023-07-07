import 'package:flutter/material.dart';

class SideTriangleWidget extends StatelessWidget {
  const SideTriangleWidget({
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottum,
  });
  final double? left;
  final double? top;
  final double? right;
  final double? bottum;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottum,
      child: Transform.rotate(
        angle: 45 *
            (3.1415926535897932 / 180), // Specify the rotation angle in radians
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.111),
              borderRadius: BorderRadius.circular(60)),
          width: 250,
          height: 250,
        ),
      ),
    );
  }
}
