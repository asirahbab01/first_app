import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String message;
  final DateTime timestamp;

  NotificationModel({
    required this.id,
    required this.message,
    required this.timestamp,
  });

  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return NotificationModel(
      id: doc.id,
      message: data['message'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
