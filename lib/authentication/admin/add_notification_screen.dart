import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/notify_model.dart';
import 'package:flutter/material.dart';

class AddNotificationScreen extends StatefulWidget {
  const AddNotificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddNotificationScreenState createState() => _AddNotificationScreenState();
}

class _AddNotificationScreenState extends State<AddNotificationScreen> {
  final TextEditingController _messageController = TextEditingController();

  void _addNotification() {
    final message = _messageController.text;
    if (message.isEmpty) return;

    final notification = NotificationModel(
      id: '',
      message: message,
      timestamp: DateTime.now(),
    );

    FirebaseFirestore.instance.collection('notifications').add(notification.toMap()).then((_) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: const Text('Notification added successfully'),backgroundColor: Colors.red[400],behavior: SnackBarBehavior.floating, elevation: 0,),
      );
      _messageController.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add notification: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Notification',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Notification Message'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addNotification,
              child: const Text('Add Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
