import 'package:authentication/constants/colors.dart';
import 'package:authentication/constants/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstSection extends StatelessWidget {
  const FirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
          color: textFormFieldColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HELLO RATUL 👋',
                style: bodyTextStyle.copyWith(fontWeight: FontWeight.bold)),
            smallHeight,
            Expanded(
                child: Text('What you are looking for today',
                    style: GoogleFonts.inter(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            Card(
              elevation: 0,
              color: const Color.fromARGB(255, 26, 35, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color.fromARGB(255, 103, 89, 255),
                            //(103, 89, 255, 1)
                          ),
                          child: const Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 20)
                      ],
                    ),
                    hintText: 'Search what you need...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.grey.withOpacity(.5), width: 2),
                        borderRadius: BorderRadius.circular(15))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
