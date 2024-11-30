import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/authentication/users/sign_in.dart';
import 'package:first_app/models/notify_model.dart';
import 'package:first_app/pages/ai_chat_page.dart';
import 'package:first_app/pages/drawer-options/crop_calender.dart';
import 'package:first_app/pages/explore_page.dart';
import 'package:first_app/pages/notifypages.dart';
import 'package:first_app/pages/profile_page.dart';
import 'package:first_app/pages/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:badges/badges.dart' as badges;

import 'package:first_app/pages/drawer-options/about_us.dart';
import '../pages/drawer-options/feedback.dart';
import 'predict.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;
  const HomePage({super.key, this.initialIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const Explore(),
    const ServicesPage(),
    const ChatScreen(),
    const TensorFlow(),
    const ProfilePage(),
  ];

  late int currentPageIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Notifications state
  List<NotificationModel> hardcodedNotifications = [];
  int notificationCount = 0;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.initialIndex;
    _listenToNotifications();
  }

  void _listenToNotifications() {
    FirebaseFirestore.instance
        .collection('notifications')
        .snapshots()
        .listen((snapshot) {
      setState(() {
        notificationCount =
            snapshot.docs.length + hardcodedNotifications.length;
      });
    });
  }

  Future<bool?> _showExitConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit App",style: TextStyle(color: Colors.redAccent),),
        content: const Text("Are you sure you want to exit?"),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pop(false), // Stay in the app
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop(); // Completely exit the app
            },
            child: Text("Exit",style: TextStyle(color: Colors.red[400]),),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, Object? result) {
        onBackPressed(didPop);
      },
      child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            backgroundColor: Colors.greenAccent,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 61, 180, 65),
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 38,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.dashboard_customize_rounded),
                  title: const Text('Dashboard'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.eco_rounded),
                  title: const Text('Crop Calendar'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CropWeatherCalendarPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUsPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.feedback),
                  title: const Text('Feedback'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedbackPage(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout_sharp),
                  title: const Text('Logout'),
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
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                      );
                    } catch (e) {
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
                            child: Text("Failed to sign out: $e",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white)),
                          ),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          appBar: currentPageIndex ==
                  2 // Check if currentPageIndex is 2 (Agro 3.5 page)
              ? null // Set to null to hide AppBar
              : AppBar(
                  centerTitle: false,
                  title: currentPageIndex == 0
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello there 👋🏾',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                            Text('Enjoy our services',
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        )
                      : currentPageIndex == 1
                          ? Text('Our Services',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold))
                          : currentPageIndex == 3
                              ? Text('Mango Leaf Prediction',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontWeight: FontWeight.bold))
                              : currentPageIndex == 4
                                  ? Text('Profile Section',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold))
                                  : null,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton.filledTonal(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Notif(
                                  hardcodedNotifications:
                                      hardcodedNotifications),
                            ),
                          );
                        },
                        icon: badges.Badge(
                          badgeContent: Text(
                            '$notificationCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          position: badges.BadgePosition.topStart(
                              top: -15, start: -12),
                          badgeStyle: const badges.BadgeStyle(
                            badgeColor: Colors.lightGreen,
                          ),
                          child: const Icon(IconlyBroken.notification),
                        ),
                      ),
                    ),
                  ],
                ),
          body: pages[currentPageIndex],
          bottomNavigationBar: currentPageIndex !=
                  2 // Hide BottomNavigationBar only for Agro 3.5 (index 2)
              ? BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: currentPageIndex,
                  onTap: (index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(IconlyLight.home),
                      activeIcon: Icon(IconlyBold.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(IconlyLight.call),
                      activeIcon: Icon(IconlyBold.call),
                      label: "Services",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(IconlyLight.chat),
                      activeIcon: Icon(IconlyBold.chat),
                      label: "Agro 3.5",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(IconlyLight.game),
                      activeIcon: Icon(IconlyBold.game),
                      label: "Predict",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(IconlyLight.profile),
                      activeIcon: Icon(IconlyBold.profile),
                      label: "Profile",
                    ),
                  ],
                )
              : null),
    );
  }

  onBackPressed(didPop) async {
    if (currentPageIndex != 0) {
      setState(() {
        currentPageIndex = 0; // Redirect to Explore page
      });
      return false; // Prevent the app from exiting
    } else {
      // Show confirmation dialog when the user presses the back button on the Explore page
      bool exitConfirmed = await _showExitConfirmationDialog(context) ?? false;
      return exitConfirmed; // Exit if confirmed, otherwise stay in the app
    }
  }
}
