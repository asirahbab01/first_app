// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'add_notification_screen.dart';
import 'package:first_app/authentication/admin/admin_sign_in.dart'; // Import the admin sign-in page
import 'package:first_app/authentication/users/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'dart:io';
import 'package:file_picker/file_picker.dart';

import 'admin_feedback_page.dart';
import 'admin_forum.dart';
import 'admin_members_page.dart';
import 'admin_notification_page.dart';
import 'ngo_workers_page.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int registeredWorkers = 0;
  int displayedNotifications = 0;
  int activeAdmins = 0;
  int activeFeedback = 0;
  int displayedPosts = 0;
  int addedWorkers = 0;

  @override
  void initState() {
    super.initState();
    _listenToFirestoreUpdates(); // Listen for real-time updates
  }

  void _listenToFirestoreUpdates() {
    // Listen for real-time updates for registered workers
    FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        registeredWorkers = snapshot.docs.length;
      });
    });

    // Listen for real-time updates for notifications
    FirebaseFirestore.instance
        .collection('notifications')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        displayedNotifications = snapshot.docs.length;
      });
    });

    // Listen for real-time updates for active admins
    FirebaseFirestore.instance
        .collection('admin')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        activeAdmins = snapshot.docs.length;
      });
    });

    // Listen for real-time updates for feedback
    FirebaseFirestore.instance
        .collection('feedback')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        activeFeedback = snapshot.docs.length;
      });
    });

    // Listen for real-time updates for forum post
    FirebaseFirestore.instance
        .collection('forum_posts')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        displayedPosts = snapshot.docs.length;
      });
    });
    
    // Listen for real-time updates of workers
    FirebaseFirestore.instance
        .collection('workers')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        addedWorkers = snapshot.docs.length;
      });
    });
  }

  Future<void> uploadFile(
      BuildContext context, String crop, String region) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      String fileName = '${crop}_$region.pdf';

      try {
        // Upload PDF to Firebase Storage
        final storageRef =
            FirebaseStorage.instance.ref().child('crop_calendars/$fileName');
        await storageRef.putFile(file);

        // Get the download URL
        String downloadURL = await storageRef.getDownloadURL();

        // Save the URL to Firestore
        await FirebaseFirestore.instance.collection('crop_calendars').add({
          'crop': crop,
          'region': region,
          'url': downloadURL,
        });
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('File uploaded and stored successfully'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to upload file: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          padding: const EdgeInsets.all(16),
          height: 48.25,
          decoration: const BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.all((Radius.circular(20))),
          ),
          child: const Text("Successfully Signed Out",
              style: TextStyle(fontSize: 12, color: Colors.white)),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const AdminSignInScreen()), // Redirect to the admin sign-in page
      );
    } 
    catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sign out: $e'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> crops = [
      'Banana',
      'Brinjal',
      'Cotton',
      'Green gram',
      'Potato',
      'Onion',
      'Jujube',
      'Jute',
      'Lentil',
      'Mustard',
      'Pointed Gourd',
      'Maize (Rabi)',
      'Pumpkin',
      'Tomato',
      'Sugarcane',
    ];

    final List<String> regions = [
      'Barishal',
      'Bogura',
      'Dhaka',
      'Jessore',
      'Mymensingh',
      'Cumilla',
      'Dinajpur',
      'Faridpur',
      'Khulna',
      'Rajshahi',
      'Rangpur',
    ];

    final List<String> districts = [
      'Bagerhat',
      'Bandarban',
      'Barguna',
      'Barishal',
      'Bhola',
      'Bogura',
      'Brahmanbaria',
      'Chandpur',
      'Chattogram',
      'Chuadanga',
      'Cumilla',
      'Cox\'s Bazar',
      'Dhaka',
      'Dinajpur',
      'Faridpur',
      'Feni',
      'Gaibandha',
      'Gazipur',
      'Gopalganj',
      'Habiganj',
      'Jamalpur',
      'Jashore',
      'Jhalokathi',
      'Jhenaidah',
      'Joypurhat',
      'Khagrachari',
      'Khulna',
      'Kishoreganj',
      'Kurigram',
      'Kushtia',
      'Lakshmipur',
      'Lalmonirhat',
      'Madaripur',
      'Magura',
      'Manikganj',
      'Meherpur',
      'Moulvibazar',
      'Munshiganj',
      'Mymensingh',
      'Naogaon',
      'Narail',
      'Narayanganj',
      'Narsingdi',
      'Natore',
      'Netrokona',
      'Nilphamari',
      'Noakhali',
      'Pabna',
      'Panchagarh',
      'Patuakhali',
      'Pirojpur',
      'Rajbari',
      'Rajshahi',
      'Rangamati',
      'Rangpur',
      'Satkhira',
      'Shariatpur',
      'Sherpur',
      'Sirajganj',
      'Sunamganj',
      'Sylhet',
      'Tangail',
      'Thakurgaon',
    ];

    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, Object? result) {
          onBackPressed(didPop);
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              Expanded(
                  child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AddNotificationScreen()),
                        );
                      },
                      child: Text(
                        'Add Notification',
                        style: TextStyle(color: Colors.green[700]),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            String? selectedCrop;
                            String? selectedRegion;
                            return AlertDialog(
                              title: const Text(
                                'Upload Crop Calendar',
                                style: TextStyle(color: Colors.green),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                        labelText: 'Select Crop'),
                                    items: crops.map((crop) {
                                      return DropdownMenuItem(
                                        value: crop,
                                        child: Text(crop),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      selectedCrop = value;
                                    },
                                  ),
                                  DropdownButtonFormField<String>(
                                    decoration: const InputDecoration(
                                        labelText: 'Select Region'),
                                    items: regions.map((region) {
                                      return DropdownMenuItem(
                                        value: region,
                                        child: Text(region),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      selectedRegion = value;
                                    },
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (selectedCrop != null &&
                                        selectedRegion != null) {
                                      uploadFile(context, selectedCrop!,
                                          selectedRegion!);
                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Please select both crop and region'),
                                          backgroundColor: Colors.red,
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text('Upload'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        'Add Crop Calendar',
                        style: TextStyle(color: Colors.green[700]),
                      ),
                    ),
                    
                    TextButton(
                      onPressed: () => signOut(context),
                      child: Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.red[700]),
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Admin Panel',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: [
                      _buildMetricCard(
                        'Registered NGO-Workers',
                        registeredWorkers.toString(),
                        Colors.blue,
                        Icons.people,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisteredWorkersPage()),
                          );
                        },
                      ),
                      _buildMetricCard(
                        'Displayed Notifications',
                        displayedNotifications.toString(),
                        Colors.green,
                        Icons.notifications,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminNotificationPage()),
                          );
                        },
                      ),
                      _buildMetricCard(
                        'Active Admin Members',
                        activeAdmins.toString(),
                        Colors.orange,
                        Icons.admin_panel_settings,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActiveAdminsPage()),
                          );
                        },
                      ),
                      _buildMetricCard(
                        'Feedback Submitted',
                        activeFeedback.toString(),
                        Colors.purple,
                        Icons.feedback,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminFeedbackPage()),
                          );
                        },
                      ),
                      _buildMetricCard(
                        "Manage Forum Posts",
                        displayedPosts.toString(),
                        Colors.yellow,
                        Icons.comment,
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AdminForumManagement()),
                          );
                        },
                      ),
                      _buildMetricCard(
                        "Add Workers",
                        addedWorkers.toString(),
                        Colors.lightBlue,
                        Icons.man_2,
                         () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AddWorkerDialog(
                                districts:
                                    districts); // Pass districts to the dialog
                          },
                        );
                      },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  onBackPressed(didPop) async {
    bool exitConfirmed = await _showExitConfirmationDialog(context) ?? false;
    return exitConfirmed; // Exit if confirmed, otherwise stay in the app
  }
}

Future<bool?> _showExitConfirmationDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        "Exit Admin Panel",
        style: TextStyle(color: Colors.red),
      ),
      content: const Text("Are you sure you want to exit from admin panel?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false), // Stay in the app
          child: const Text("No"),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Redirecting...'),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            ); // Completely exit from admin panel
          },
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.red[400]),
          ),
        )
      ],
    ),
  );
}

Widget _buildMetricCard(String title, String value, Color color, IconData icon,
    VoidCallback onTap) {
  return Expanded(
      child: GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 42.0, color: color),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          )));
}

class AddWorkerDialog extends StatefulWidget {
  final List<String> districts; // Receive the districts list

  const AddWorkerDialog({required this.districts, super.key});

  @override
  _AddWorkerDialogState createState() => _AddWorkerDialogState();
}

class _AddWorkerDialogState extends State<AddWorkerDialog> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _mobile;
  String? _place;
  String? _role;
  String? _region;

  final List<String> _districts = [
    'Barguna', 'Barishal', 'Bhola', 'Jhalokathi', 'Patuakhali',
    'Pirojpur', // Barisal Division
    'Bandarban',
    'Brahmanbaria',
    'Chandpur',
    'Chattogram',
    'Cumilla',
    'Cox\'s Bazar',
    'Feni',
    'Khagrachari',
    'Lakshmipur',
    'Noakhali',
    'Rangamati', // Chittagong Division
    'Dhaka',
    'Faridpur',
    'Gazipur',
    'Gopalganj',
    'Kishoreganj',
    'Madaripur',
    'Manikganj',
    'Munshiganj',
    'Narayanganj',
    'Narsingdi',
    'Rajbari',
    'Shariatpur',
    'Tangail', // Dhaka Division
    'Bagerhat', 'Chuadanga', 'Jashore', 'Jhenaidah', 'Khulna', 'Kushtia',
    'Magura', 'Meherpur', 'Narail', 'Satkhira', // Khulna Division
    'Jamalpur', 'Mymensingh', 'Netrokona', 'Sherpur', // Mymensingh Division
    'Bogura', 'Joypurhat', 'Naogaon', 'Natore', 'Chapainawabganj', 'Pabna',
    'Rajshahi', 'Sirajganj', // Rajshahi Division
    'Dinajpur', 'Gaibandha', 'Kurigram', 'Lalmonirhat', 'Nilphamari',
    'Panchagarh', 'Rangpur', 'Thakurgaon', // Rangpur Division
    'Habiganj', 'Moulvibazar', 'Sunamganj', 'Sylhet' // Sylhet Division
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Worker'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _name = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Mobile'),
                keyboardType: TextInputType.phone,
                maxLength: 11,
                onSaved: (value) {
                  _mobile = value;
                },
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length != 11 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Please enter an 11-digit mobile number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Place'),
                onSaved: (value) {
                  _place = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a place';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Role'),
                onSaved: (value) {
                  _role = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a role';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Region'),
                items: _districts.map((district) {
                  return DropdownMenuItem(
                    value: district,
                    child: Text(district),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _region = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a region';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              _formKey.currentState?.save();
              _addWorkerToFirestore();
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Worker added successfully'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.redAccent,
                ),
              );
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }

  Future<void> _addWorkerToFirestore() async {
    if (_name != null &&
        _mobile != null &&
        _place != null &&
        _role != null &&
        _region != null) {
      try {
        await FirebaseFirestore.instance.collection('workers').add({
          'name': _name,
          'mobile': _mobile,
          'place': _place,
          'role': _role,
          'region': _region,
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add worker: $e'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
