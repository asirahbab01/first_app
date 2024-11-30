import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForumPost {
  final String id;
  final String content;
  final String author;
  final String division;
  final List<String> likes;
  final List<String> dislikes;
  final List<Map<String, dynamic>> replies;
  final Timestamp timeStamp;

  ForumPost({
    required this.id,
    required this.content,
    required this.author,
    required this.division,
    required this.likes,
    required this.dislikes,
    required this.replies,
    required this.timeStamp,
  });

  // Factory constructor to create a ForumPost from Firestore document
  factory ForumPost.fromDocument(DocumentSnapshot doc) {
    return ForumPost(
      id: doc.id,
      content: doc['content'],
      author: doc['author'],
      division: doc['division'],
      likes: List<String>.from(doc['likes']),
      dislikes: List<String>.from(doc['dislikes']),
      replies: List<Map<String, dynamic>>.from(doc['replies']),
      timeStamp: doc['timestamp'] ?? Timestamp.now(),
    );
  }

  // Add a new post to Firestore
  static Future<void> addPost(String content) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    if (user != null) {
      // Fetch user data (full name, division)
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(user.uid).get();
      String fullname = userDoc['fullname'];
      String division = userDoc['division'];

      await firestore.collection('forum_posts').add({
        'content': content,
        'author': fullname,
        'division': division,
        'timestamp': FieldValue.serverTimestamp(),
        'likes': [],
        'dislikes': [],
        'replies': [],
      });
    }
  }

  // Like a post
  static Future<void> likePost(String postId) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    if (user == null) return;

    final uid = user.uid;
    DocumentReference postRef = firestore.collection('forum_posts').doc(postId);

    DocumentSnapshot postSnapshot = await postRef.get();
    List<String> likes = List<String>.from(postSnapshot['likes']);

    if (likes.contains(uid)) {
      postRef.update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      postRef.update({
        'likes': FieldValue.arrayUnion([uid]),
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    }
  }

  // Dislike a post
  static Future<void> dislikePost(String postId) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    if (user == null) return;

    final uid = user.uid;
    DocumentReference postRef = firestore.collection('forum_posts').doc(postId);

    DocumentSnapshot postSnapshot = await postRef.get();
    List<String> dislikes = List<String>.from(postSnapshot['dislikes']);

    if (dislikes.contains(uid)) {
      postRef.update({
        'dislikes': FieldValue.arrayRemove([uid]),
      });
    } else {
      postRef.update({
        'dislikes': FieldValue.arrayUnion([uid]),
        'likes': FieldValue.arrayRemove([uid]),
      });
    }
  }

  static Future<void> addReply(String postId, String replyContent) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Fetch the user's name
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      String fullname = userDoc['fullname'];

      // Add the reply with both content and author
      await FirebaseFirestore.instance
          .collection('forum_posts')
          .doc(postId)
          .update({
        'replies': FieldValue.arrayUnion([
          {'reply': replyContent, 'author': fullname}
        ]),
      });
    }
  }
}
