import 'dart:developer';

import 'package:authentication/bottum_nav/bottum_nav.dart';
import 'package:authentication/constants/colors.dart';
import 'package:authentication/screens/widgets/snackbar.dart';
import 'package:authentication/screens/widgets/widthed_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../../../bloc/auth/auth_bloc.dart';
import '../../../constants/gaps.dart';

class ScreenOTPEnter extends StatelessWidget {
  ScreenOTPEnter({super.key});

  // final String verificationId;
  final ValueNotifier<String> code = ValueNotifier('');
  // final String code = '';

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: textFormFieldColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: scaffoldBackgroundColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: scaffoldBackgroundColor,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'OTP Verification! 👋',
                style: titleTextStyle,
              ),
              smallHeight,
              const Text(
                'Enter the OTP',
                style: bodyTextStyle,
              ),
              mediumHeight,
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                // validator: (s) {
                //   return s == '2222' ? null : 'Pin is incorrect';
                // },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  code.value = pin;
                },
              ),
              mediumHeight,
              Align(
                  child: ValueListenableBuilder(
                valueListenable: code,
                builder: (context, value, child) {
                  return BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoadingstate) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScreenMain(),
                            ),
                            (route) => false);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingstate) {
                        return const CircularProgressIndicator();
                      } else if (state is AuthErrorState) {
                        return SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.green,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(5),
                        );
                        // return ScaffoldMessenger.of(context).showSnackBar(snackdemo);
                      } else {
                        return MoreWidthButton(
                            text: 'Verify',
                            onClick: () async {
                              log(code.value);
                              BlocProvider.of<AuthBloc>(context)
                                  .add(OTPVerificationEvent(code.value));
                            });
                      }
                    },
                  );
                },
                // child:
              ))
            ],
          ),
        ),
      ),
    );
  }
}
