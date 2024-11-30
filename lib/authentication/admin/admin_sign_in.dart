// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/authentication/admin/admin_home_page.dart';
import 'package:first_app/authentication/users/sign_in.dart'; // Ensure this is imported
import 'package:first_app/utils/color_utils.dart';
import 'package:first_app/widgets/reusable.dart';
import 'package:flutter/material.dart';

class AdminSignInScreen extends StatefulWidget {
  const AdminSignInScreen({super.key});

  @override
  State<AdminSignInScreen> createState() => _AdminSignInScreenState();
}

class _AdminSignInScreenState extends State<AdminSignInScreen> {
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
              hexStringtoColor("83f28f")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.1,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/motto.png"),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Admin Login",
                  selectionColor: Colors.red,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold,fontSize: 25),
                ),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField(
                  "Enter Admin Email ID",
                  Icons.email_sharp,
                  false,
                  emailController,
                ),
                const SizedBox(
                  height: 25,
                ),
                reusableTextField(
                  "Enter Admin Password",
                  Icons.lock_outline,
                  true,
                  passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Log In as User",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                firebaseUIButton(context, "Log In as Admin", () async {
                  try {
                    // Fetch admin credentials from Firestore
                    QuerySnapshot snapshot = await FirebaseFirestore.instance
                        .collection('admin')
                        .where('email', isEqualTo: emailController.text)
                        .where('password', isEqualTo: passwordController.text)
                        .get();

                    if (snapshot.docs.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                          padding: const EdgeInsets.all(16),
                          height: 49,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all((Radius.circular(20))),
                          ),
                          child: const Text("Admin LogIn Successful",
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
                          builder: (context) => const AdminPanel(),
                        ),
                      );
                    } else {
                      throw Exception("Invalid admin credentials");
                    }
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Container(
                        padding: const EdgeInsets.all(16),
                        height: 47,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            (Radius.circular(20)),
                          ),
                        ),
                        child: const Text("Invalid Admin credentials",
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ));
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
