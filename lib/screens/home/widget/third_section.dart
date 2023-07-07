import 'package:authentication/constants/colors.dart';
import 'package:flutter/material.dart';

class ThirdSection extends StatelessWidget {
  const ThirdSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          color: textFormFieldColor, borderRadius: BorderRadius.circular(10)),
      child: ListView(
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        children: [
          const CircleOptions(
              circleColor: Color.fromARGB(255, 255, 188, 153),
              imagePath: 'assets/images/Laundry a shirt.png',
              text: 'Wash'),
          const CircleOptions(
              circleColor: Color.fromARGB(255, 202, 189, 255),
              imagePath: 'assets/images/iron_box.png',
              text: 'Iron'),
          const CircleOptions(
              circleColor: Color.fromARGB(255, 255, 216, 141),
              imagePath: 'assets/images/dry_wash.png',
              text: 'Wash'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(.1),
                    border: Border.all(
                      color: Colors.grey[700]!,
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
              ),
              const Text(
                'See All',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CircleOptions extends StatelessWidget {
  const CircleOptions({
    super.key,
    required this.imagePath,
    required this.circleColor,
    required this.text,
    this.raduis,
  });
  final String imagePath;
  final Color circleColor;
  final String? text;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: raduis ?? 35,
            backgroundColor: circleColor,
            child: Image.asset(
              imagePath,
            ),
          ),
          text != null
              ? Text(
                  text!,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}