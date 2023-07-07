import 'package:authentication/constants/colors.dart';
import 'package:authentication/constants/gaps.dart';
import 'package:flutter/material.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
          color: textFormFieldColor, borderRadius: BorderRadius.circular(10)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          OfferCards(
            cardColor: Color.fromARGB(255, 255, 188, 153),
          ),
          OfferCards(
            cardColor: Colors.white,
          )
        ],
      ),
    );
  }
}

class OfferCards extends StatelessWidget {
  const OfferCards({super.key, required this.cardColor});
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Container(
        height: double.infinity,
        width: deviceSize.width * .7,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: cardColor,

          //(255, 188, 153, 1)
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Offer Laundry Service',
                    style: TextStyle(
                        color: greyShadeBlack, fontWeight: FontWeight.bold),
                  ),
                  extraSmallWidth,
                  Icon(
                    Icons.info,
                    color: greyShadeBlack,
                    size: 20,
                  )
                ],
              ),
              smallHeight,
              const Text(
                'Get 25%',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              // smallHeight,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: grabOfferButtonBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  child: const Text('Grab Offer >'))
            ],
          ),
        ),
      ),
    );
  }
}