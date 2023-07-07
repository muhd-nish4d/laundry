import 'package:authentication/constants/colors.dart';
import 'package:authentication/constants/gaps.dart';
import 'package:flutter/material.dart';

class FourthSection extends StatelessWidget {
  const FourthSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 330,
      decoration: BoxDecoration(
          color: textFormFieldColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 6,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 202, 180, 255),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const Text(
                  'Nearest Laundry',
                  style: titleTextStyle,
                ),
                smallWidth,
                smallWidth,
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey, width: 2),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(30)),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text('See All >'))
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            children: const [
              NearestLaundryCards(
                imagePath: 'assets/images/Group 34037.png',
              ),
              normalWidth,
              NearestLaundryCards(
                imagePath: 'assets/images/Group 34037-1.png',
              ),
              normalWidth,
              NearestLaundryCards(
                imagePath: 'assets/images/Group 34037.png',
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class NearestLaundryCards extends StatelessWidget {
  const NearestLaundryCards({super.key, required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage(imagePath))),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Laundry Name',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}
