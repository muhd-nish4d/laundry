import 'package:authentication/constants/colors.dart';
import 'package:flutter/material.dart';

class MianAppBar extends StatelessWidget {
  const MianAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        color: textFormFieldColor,
        child: Center(
          child: ListTile(
            leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/app_user_icon.png')),
            title: const Text(
              'CURRENT LOCATION',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            subtitle: Row(
              children: const [
                Text(
                  '15A, James Street',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1),
                ),
                Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.white,
                )
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text('BRONZE',
                        style: TextStyle(
                            color: Color.fromARGB(255, 244, 191, 75),
                            fontSize: 13)),
                    Text(
                      '0 POINTS',
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontSize: 9),
                    )
                  ],
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/Badge.png'))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
