import 'package:authentication/constants/gaps.dart';
import 'package:authentication/screens/home/widget/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widget/first_section.dart';
import 'widget/fourth_section.dart';
import 'widget/second_section.dart';
import 'widget/third_section.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MianAppBar(),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: const [
              FirstSection(),
              normalHeight,
              SecondSection(),
              normalHeight,
              ThirdSection(),
              normalHeight,
              FourthSection()
            ],
          ),
        ),
      ],
    );
  }
}
