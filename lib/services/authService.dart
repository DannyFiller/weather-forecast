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

  Future<void> showIdUser() async {
    print(FirebaseAuth.instance.currentUser!.uid.toString());
  }
}
