import 'dart:typed_data';
import 'package:first_app/pages/settings.dart';
import 'package:first_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:first_app/authentication/users/sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:first_app/main.dart';
import 'policy.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with RouteAware {
  String userName = '';
  String userEmail = '';
  String? profileImageUrl;
  String userDivisionCity = '';
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ModalRoute? modalRoute = ModalRoute.of(context);
    if (modalRoute is PageRoute) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    _loadUserData();
  }

  // Load user data (name, email, division, profile image)
  Future<void> _loadUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          print("User document data: ${userDoc.data()}");
          setState(() {
            userName = userDoc.get('fullname') ?? '';
            userEmail = userDoc.get('email') ?? '';
            // Check if the 'profileImage' field exists before fetching it
            profileImageUrl = userDoc.data().toString().contains('profileImage')
                ? userDoc.get('profileImage')
                : null;
            userDivisionCity = userDoc.get('division') ?? ''; // Fetch division city
          });
        }
      } catch (e) {
        _showErrorSnackbar("Failed to load user data: $e");
      }
    }
  }

  // Pick image from gallery
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  // Upload image to Firebase Storage
  Future<String> uploadImageToStorage(Uint8List image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('profilePics')
        .child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // Save profile image to Firestore
  Future<void> saveProfileImage() async {
    if (_image != null) {
      try {
        String downloadUrl = await uploadImageToStorage(_image!);
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({'profileImage': downloadUrl});

          _showSuccessSnackbar("Profile image uploaded successfully!");
          setState(() {
            profileImageUrl = downloadUrl;
          });
        }
      } catch (e) {
        _showErrorSnackbar("Failed to upload profile image: $e");
      }
    }
  }

  // Show error message in Snackbar
  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          height: 47,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(message, style: const TextStyle(fontSize: 12, color: Colors.white)),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  // Show success message in Snackbar
  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          height: 47,
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Text(message, style: const TextStyle(fontSize: 12, color: Colors.white)),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 62,
                    backgroundImage: _image != null
                        ? MemoryImage(_image!)
                        : profileImageUrl != null
                            ? NetworkImage(profileImageUrl!)
                            : const NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQACGFpr0iqURE_6EHYMm-AGXfhXC1Nzf4ucA&s",
                              ) as ImageProvider,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 3.4,
                  left: 5,
                  child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              userName.isEmpty ? 'Loading...' : userName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              userEmail.isEmpty ? 'Loading...' : userEmail,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, color: Colors.grey, size: 10),
                const SizedBox(width: 4),
                Text(
                  userDivisionCity.isEmpty ? 'Loading...' : userDivisionCity,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: saveProfileImage,
            child: const Text("Save Profile Image"),
          ),
          const SizedBox(height: 25),
          ListTile(
            title: const Text("Settings"),
            leading: const Icon(IconlyLight.setting),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()));
            },
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            leading: const Icon(Icons.policy_outlined),
            onTap: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: true,
                barrierLabel: '',
                barrierColor: Colors.black.withOpacity(0.5), // Semi-transparent background
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, _, __) {
                  return const Center(
                    child: PolicyDialog(mdFileName: 'privacy_policy.md'),
                  );
                },
                transitionBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(IconlyLight.logout),
            onTap: () async {
              try {
                await FirebaseAuth.instance.signOut();
                     ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                            padding: const EdgeInsets.all(16),
                            height: 49,
                            decoration: const BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: const Text("Signed out successfully",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white)),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()),
                );
              } catch (e) {
                _showErrorSnackbar("Failed to sign out: $e");
              }
            },
          ),
        ],
      ),
    );
  }
}
