import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      String feedback = _feedbackController.text;
      User? user = _auth.currentUser;

      if (user != null) {
        try {
          // Fetch user's full name and division from Firestore
          DocumentSnapshot userDoc =
              await _firestore.collection('users').doc(user.uid).get();
          String fullname = userDoc['fullname'];
          String division = userDoc['division'];

          // Send feedback to Firestore with user's full name and division
          await _firestore.collection('feedback').add({
            'feedback': feedback,
            'timestamp': FieldValue.serverTimestamp(),
            'fullname': fullname,
            'division': division,
          });

          // Clear the text field
          _feedbackController.clear();

          // Show a confirmation message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                padding: const EdgeInsets.all(16),
                height: 47,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all((Radius.circular(20))),
                ),
                child: const Text("Thank you for your feedback!!",
                    style: TextStyle(fontSize: 12, color: Colors.white)),
              ),
              backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
              elevation: 0,
            ),
          );
        } catch (e) {
          // Show an error message if submission fails
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Container(
                padding: const EdgeInsets.all(16),
                height: 47,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all((Radius.circular(20))),
                ),
                child: Text("Failed to submit feedback $e",
                    style: const TextStyle(fontSize: 12, color: Colors.white)),
              ),
              backgroundColor: Colors.transparent,
              behavior: SnackBarBehavior.floating,
              elevation: 0,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'How can we improve?',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some feedback';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitFeedback,
                child: const Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
