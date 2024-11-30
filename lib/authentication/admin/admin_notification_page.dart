import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminNotificationPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   AdminNotificationPage({super.key});

  Future<void> _removeNotification(String notificationId) async {
    await _firestore.collection('notifications').doc(notificationId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Notifications'),backgroundColor: Colors.greenAccent[700],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('notifications').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final notifications = snapshot.data!.docs;
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return Card(
                child: ListTile(
                  title: Text(notification['message']),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeNotification(notification.id),
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
