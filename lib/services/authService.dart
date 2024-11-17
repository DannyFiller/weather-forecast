import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class Authservice {
  Authservice() {}
  Future<void> sendEmailVerificationLink(BuildContext context) async {
    try {
      await FirebaseAuth.instance.currentUser?.sendEmailVerification();
      ShowDialog(context, "Verification Your Email");
    } catch (e) {
      print(e);
    }
  }

  void ShowDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(title)],
            ),
          ),
        );
      },
    );
  }

  Future<void> sendSignInLink(String email) async {
    try {
      final ActionCodeSettings actionCodeSettings = ActionCodeSettings(
        url: 'http://localhost:52804/', // URL khi người dùng nhấn vào liên kết
        handleCodeInApp: true,
        androidPackageName: 'com.example.weather-forecast',
        androidInstallApp: false,
        androidMinimumVersion: '21',
        iOSBundleId: 'com.example.weather-forecast',
      );

      // Gửi email chứa liên kết đăng nhập
      await FirebaseAuth.instance.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSettings,
      );

      print('Email đăng nhập đã được gửi đến $email');
    } catch (e) {
      print('Lỗi khi gửi email: $e');
    }
  }
}
