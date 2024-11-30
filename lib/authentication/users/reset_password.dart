import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/widgets/reusable.dart';
import 'package:first_app/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:first_app/authentication/users/sign_in.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringtoColor("90EE90"),
            hexStringtoColor("32CD32"),
            hexStringtoColor("83f28f")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Reset Password", () {
                  FirebaseAuth.instance
                      .sendPasswordResetEmail(email: _emailTextController.text)
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Container(
                        padding: const EdgeInsets.all(16),
                        height: 47,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all((Radius.circular(20))),
                        ),
                        child: const Text("Email sent for reset password",
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()));
                  }).onError(
                    (error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(16),
                          height: 47,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all((Radius.circular(20))),
                          ),
                          child: const Text("Failed to reset password",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.white)),
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));
                    },
                  );
                })
              ],
            ),
          ))),
    );
  }
}
