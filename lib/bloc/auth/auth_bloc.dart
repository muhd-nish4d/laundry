import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? phoneVerificationId;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  AuthBloc() : super(AuthInitialState()) {
    final User? currentUser = firebaseAuth.currentUser;

    // Checking the user Already exist or not
    on<AuthInitialEvent>((event, emit) {
      if (currentUser != null) {
        emit(AuthLoggedinState());
      } else {
        emit(AuthLoggedOutState());
      }
    });

    // When the user enter phone number
    on<PhoneNumberSubmittEvent>((event, emit) async {
      emit(AuthLoadingstate());
      sentOtp(event.phoneNumber);
    });

    // If the user enter phone number we wan't verify that with otp
    on<OTPVerificationEvent>((event, emit) async {
      emit(AuthLoadingstate());
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: phoneVerificationId!, smsCode: event.otp);
        await firebaseAuth.signInWithCredential(credential);
        emit(AuthLoggedinState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
  }

  
  void sentOtp(String phoneNumber) async {
    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        emit(AuthErrorState(error.message.toString()));
      },
      codeSent: (verificationId, forceResendingToken) {
        phoneVerificationId = verificationId;
        emit(AuthCodeSentState());
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
}
