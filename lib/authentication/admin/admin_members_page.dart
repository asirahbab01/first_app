import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ActiveAdminsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   ActiveAdminsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Admin Accounts'),
        backgroundColor: Colors.orange,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('admin').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final admins = snapshot.data!.docs;
          return ListView.builder(
            itemCount: admins.length,
            itemBuilder: (context, index) {
              final admin = admins[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(admin['name']),
                  subtitle: Text('Email: ${admin['email']}'),
                  leading: CircleAvatar(
                  child: Text(admin['name']?.substring(0, 1) ?? 'W'),
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
