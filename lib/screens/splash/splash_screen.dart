import 'dart:async';

import 'package:authentication/screens/splash/widgets/center_circle.dart';
import 'package:authentication/screens/splash/widgets/side_triangle.dart';
import 'package:authentication/screens/starting/get_start.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const ScreenGetStarted())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('Laundry',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40)),
            ),
            const SideTriangleWidget(left: -190, top: -30),
            const SideTriangleWidget(left: -170, top: 25),
            const CentreCircleWidget(size: 200, opacity: .1),
            const CentreCircleWidget(size: 180, opacity: .3),
            const CentreCircleWidget(size: 160, opacity: .5),
            const CentreCircleWidget(size: 140, opacity: .7),
            const SideTriangleWidget(bottum: -100, right: -210),
            const SideTriangleWidget(bottum: -45, right: -190)
          ],
        ),
      ),
    );
  }
}
