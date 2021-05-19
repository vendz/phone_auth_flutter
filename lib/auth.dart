import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_authentication_flutter/screens/otp_page.dart';

class PhoneAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(BuildContext context, number) async {
    final PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
    };

    final PhoneVerificationFailed verificationFailed =
        (FirebaseAuthException e) async {
      if (e.code == 'invalid-phone-number') {
        print('provided phone number is not valid');
      }
      print('the error is $e.code');
    };

    final PhoneCodeSent codeSent =
        (String verificationId, int resendToken) async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpPage(
            number: number,
            verId: verificationId,
          ),
        ),
      );
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      verificationId = verificationId;
      print(verificationId);
      print("Timout");
    };

    try {
      _auth.verifyPhoneNumber(
        phoneNumber: number,
        timeout: Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      print('Error ${e.toString()}');
    }
  }
}
