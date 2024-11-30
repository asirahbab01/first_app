import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/authentication/admin/admin_sign_in.dart'; // Import the new admin sign-in screen
import 'package:first_app/authentication/users/sign_up.dart';

import 'package:first_app/pages/home_page.dart';
import 'package:first_app/utils/color_utils.dart';
import 'package:first_app/widgets/reusable.dart';
import 'package:first_app/authentication/users/reset_password.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringtoColor("90EE89"),
              hexStringtoColor("32CD32"),
              hexStringtoColor("83f28f"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: MediaQuery.of(context).size.height * 0.1,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/motto.png"),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Welcome to AdvanceAgro-Our Lives!!",
                  selectionColor: Colors.red,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField(
                  "Enter Email ID",
                  Icons.email_sharp,
                  false,
                  emailController,
                ),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  passwordController,
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    loginAsAdmin(context),
                    forgetPassword(context),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                firebaseUIButton(context, "Log In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      )
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Container(
                        padding: const EdgeInsets.all(16),
                        height: 49,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Text(
                          "LogIn Successful",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }).onError((error, stackTrace) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Container(
                        padding: const EdgeInsets.all(16),
                        height: 47,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: const Text(
                          "Invalid credentials",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ));
                  });
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?  ",
          style: TextStyle(color: Colors.black54),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpCombined()),
            );
          },
          child: const Text(
            "  Sign Up",
            style: TextStyle(
                color: Colors.lightBlue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

Widget forgetPassword(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 2 - 20, // Adjust width
    height: 34,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold,),
        textAlign: TextAlign.right,
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ResetPassword()),
      ),
    ),
  );
}

Widget loginAsAdmin(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 2 - 20, // Adjust width
    height: 34,
    alignment: Alignment.bottomLeft,
    child: TextButton(
      child: const Text(
        "Log In as Admin",
        style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold,),
        textAlign: TextAlign.left,
      ),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AdminSignInScreen()),
      ),
    ),
  );
}
