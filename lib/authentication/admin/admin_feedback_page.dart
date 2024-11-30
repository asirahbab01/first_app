import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminFeedbackPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 AdminFeedbackPage({super.key});

  Future<void> _removeFeedback(String feedbackId) async {
    await _firestore.collection('feedback').doc(feedbackId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Feedback'),
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('feedback').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final feedbacks = snapshot.data!.docs;
          return ListView.builder(
            itemCount: feedbacks.length,
            itemBuilder: (context, index) {
              final feedback = feedbacks[index];
              return Card(
                child: ListTile(
                  title: Text(feedback['feedback']),
                  subtitle: Text(feedback['fullname']),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeFeedback(feedback.id),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
