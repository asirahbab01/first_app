import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangeOrganizePage extends StatefulWidget {
  const ChangeOrganizePage({super.key});

  @override
  _ChangeOrganizePageState createState() => _ChangeOrganizePageState();
}

class _ChangeOrganizePageState extends State<ChangeOrganizePage> {
  final TextEditingController _organizeController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Organization Name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightGreen)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _organizeController,
              decoration: const InputDecoration(labelText: 'New Organization'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeOrgname,
              child: const Text('Change Oraganization'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _changeOrgname() async {
    try {
      String newOrgname = _organizeController.text.trim();
      User? user = _auth.currentUser;

      if (user != null) {
        // Update the username in Firestore
        await _firestore.collection('users').doc(user.uid).update({
          'orgname': newOrgname,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Name of Organization is successfully updated.'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          elevation: 0,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update Orgname: $e')),
      );
    }
  }
}
