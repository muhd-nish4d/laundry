import 'package:authentication/constants/colors.dart';
import 'package:authentication/constants/gaps.dart';
import 'package:authentication/screens/authentication/otp/number_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../widgets/widthed_buttons.dart';

class ScreenPhoneNumber extends StatelessWidget {
  ScreenPhoneNumber({super.key});

  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome! 👋',
              style: titleTextStyle,
            ),
            smallHeight,
            const Text(
              'Create your account',
              style: bodyTextStyle,
            ),
            mediumHeight,
            const TextFormFieldForLogin(
                hintText: 'Full name', controller: null),
            smallHeight,
            TextFormFieldForLogin(
              hintText: 'Phone number',
              controller: phoneNumberController,
            ),
            mediumHeight,
            Align(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthCodeSentState) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenOTPEnter(),
                        ));
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingstate) {
                    return const CircularProgressIndicator();
                  } else {
                    return MoreWidthButton(
                        text: "Send OTP",
                        onClick: () {
                          BlocProvider.of<AuthBloc>(context).add(
                              PhoneNumberSubmittEvent(
                                  "+91${phoneNumberController.text.trim()}"));
                          // await FirebaseAuth.instance.verifyPhoneNumber(
                          //   phoneNumber:
                          //       "+91${phoneNumberController.text.trim()}",
                          //   verificationCompleted:
                          //       (PhoneAuthCredential credential) {},
                          //   verificationFailed: (FirebaseAuthException e) {},
                          //   codeSent:
                          //       (String verificationId, int? resendToken) {},
                          //   codeAutoRetrievalTimeout: (String verificationId) {},
                          // );
                        });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFormFieldForLogin extends StatelessWidget {
  const TextFormFieldForLogin({
    super.key,
    required this.hintText,
    required this.controller,
  });
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 0,
        color: textFormFieldColor,
        child: TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.all(10),
              hintStyle: const TextStyle(color: Colors.white),
              border: InputBorder.none),
        ));
  }
}
