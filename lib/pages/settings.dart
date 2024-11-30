import 'package:first_app/authentication/users/change_organize.dart';
import 'package:first_app/authentication/users/changename.dart';
import 'package:first_app/authentication/users/reset_password.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, Object? outcome) {
        onBackPressed(didPop); // Handle the back button press
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.lightGreen),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              bool didPop = true;
              onBackPressed(didPop); // Handle the back icon press
            },
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('Change Name'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeUsernamePage()),
                );
              },
            ),
            ListTile(
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ResetPassword()),
              ),
            ),
            ListTile(
              title: const Text('Change Organization Name'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeOrganizePage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  onBackPressed(didPop) {
    // Redirect to the Profile tab in the HomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => const HomePage(
              initialIndex: 4)), // Assuming Profile tab is at index 4
    );
    return false; // Prevent the default back button behavior
  }
}
