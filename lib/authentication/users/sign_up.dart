import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/utils/color_utils.dart';
import 'package:first_app/widgets/reusable.dart';
import 'package:first_app/models/user_model.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../pages/home_page.dart';

class SignUpCombined extends StatefulWidget {
  const SignUpCombined({super.key});

  @override
  _SignUpCombinedState createState() => _SignUpCombinedState();
}

class _SignUpCombinedState extends State<SignUpCombined> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _orgController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthDateController = TextEditingController(); // For birthdate

  String _selectedDivision = '';
  String _phoneNumber = '';
  final bool _isPhoneValid = true;
  DateTime? _selectedBirthDate;
  bool _isPasswordValid = true;

  void _signUp() async {
    final String fullname = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();
    final String org = _orgController.text.trim();
    final String phoneNumber = _phoneNumber.trim(); // Get full phone number

    final String birthDate = _birthDateController.text.trim(); // Get birthdate

    if (fullname.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        _selectedDivision.isNotEmpty &&
        birthDate.isNotEmpty &&
        _isPhoneValid) {
      try {
        // Create user with Firebase Authentication
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Generate unique user ID
        String userId = userCredential.user!.uid;

        // Store additional user data in Firestore
        final UserModel newUser = UserModel(
          id: userId,
          fullname: fullname,
          email: email,
          password: password,
          division: _selectedDivision, // Store division as a string
          orgname: org,
          phoneNumber: phoneNumber, // New field
          birthDate: birthDate, // Store birthdate
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .set(newUser.toJson());

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              padding: const EdgeInsets.all(16),
              height: 47,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const Text("Account is successfully created",
                  style: TextStyle(fontSize: 12, color: Colors.white)),
            ),
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            elevation: 0,
          ),
        );
        // Redirect to the Home Page after successful sign-up
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );

      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              padding: const EdgeInsets.all(16),
              height: 47,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Text("Failed to create new account: $e",
                  style: const TextStyle(fontSize: 12, color: Colors.white)),
            ),
            backgroundColor: Colors.transparent,
            behavior: SnackBarBehavior.floating,
            elevation: 0,
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            padding: const EdgeInsets.all(16),
            height: 47,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Text("Please fill all fields.",
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ),
          backgroundColor: Colors.transparent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
        ),
      );
    }
  }

  //Phone number validator
  String? _phoneValidator(String value) {
    if (value.length != 10) {
      return 'Phone number must be exactly 10 digits';
    }
    return null;
  }

  // Date picker for birthdate
  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000), // Default date
      firstDate: DateTime(1950), // Earliest selectable date
      lastDate: DateTime.now(), // Latest selectable date
    );
    if (picked != null && picked != _selectedBirthDate) {
      setState(() {
        _selectedBirthDate = picked;
        _birthDateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringtoColor("90EE90"),
              hexStringtoColor("32CD32"),
              hexStringtoColor("83f28f"),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Username',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Enter Email Id',
                    prefixIcon: Icon(Icons.email_sharp),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    prefixIcon: const Icon(Icons.lock_outlined),
                    errorText: !_isPasswordValid
                        ? null
                        : 'Password must be at least 6 characters long',
                  ),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                     setState(() {
                    _isPasswordValid = value.length <= 6;
                  });
                },
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _orgController,
                  decoration: const InputDecoration(
                    labelText: 'Enter NGO Name',
                    prefixIcon: Icon(Icons.business_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                // Birthdate Picker
                TextField(
                  controller: _birthDateController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Select Birthdate',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () => _selectBirthDate(context),
                ),
                const SizedBox(
                  height: 20,
                ),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    setState(() {
                      _phoneNumber = number.phoneNumber ?? '';
                    });
                  },
                  keyboardType: TextInputType.phone,
                  textFieldController: _phoneController,
                  initialValue: PhoneNumber(isoCode: 'BD', dialCode: '+880'),
                  selectorConfig: const SelectorConfig(
                    selectorType:
                        PhoneInputSelectorType.BOTTOM_SHEET, // Remove dropdown
                    showFlags: true, // Still show the Bangladesh flag
                    setSelectorButtonAsPrefixIcon:
                        false, // Don't allow country code change
                    leadingPadding: 0,
                  ),
                  inputDecoration: InputDecoration(
                    labelText: 'Enter Phone Number',
                    prefixIcon: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.phone),
                      ],
                    ),
                    errorText: _isPhoneValid
                        ? null
                        : 'Phone number must be exactly 10 digits',
                    counterText: '',
                  ),
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    String? plainNumber =
                        value?.replaceAll(RegExp(r'[^0-9]'), '');
                    return plainNumber != null
                        ? _phoneValidator(plainNumber)
                        : null;
                  },
                  maxLength: 10,
                ),
                const SizedBox(height: 20),
                DropdownSearch<String>(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  items: (filter, infiniteScrollProps) => [
                    "Dhaka",
                    "Khulna",
                    "Chittagong",
                    "Barishal", //ektu jhamela ase
                    "Rangpur",
                    "Rajshahi", //check for weather
                    "Comilla",
                    "Mymensingh",
                  ],
                  decoratorProps: const DropDownDecoratorProps(
                    decoration: InputDecoration(
                      labelText: "Select Division",
                      prefixIcon: Icon(Icons.location_city),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedDivision = value ?? '';
                    });
                  },
                  selectedItem: _selectedDivision,
                ),
                const SizedBox(height: 40),
                firebaseUIButton(context, "Sign Up", _signUp),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
