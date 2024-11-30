import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:timeago/timeago.dart' as timeago;

class AdminForumManagement extends StatefulWidget {
  const AdminForumManagement({super.key});

  @override
  _AdminForumManagementState createState() => _AdminForumManagementState();
}

class _AdminForumManagementState extends State<AdminForumManagement> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _postController = TextEditingController();
  final Map<String, bool> _showReplies =
      {}; // Tracks visibility of replies for each post

  Future<void> _addForumPost() async {
    if (_postController.text.isNotEmpty) {
      await _firestore.collection('forum_posts').add({
        'content': _postController.text,
        'author': 'Admin', // Author is set to 'Admin'
        'division': '', // Default division for Admin posts
        'timestamp': FieldValue.serverTimestamp(),
        'likes': [], // Initialize likes
        'dislikes': [], // Initialize dislikes
        'replies': [], // Initialize replies
      });
      _postController.clear();
    }
  }

  Future<void> _removeForumPost(String postId) async {
    await _firestore.collection('forum_posts').doc(postId).delete();
  }

  void _toggleRepliesVisibility(String postId) {
    setState(() {
      _showReplies[postId] = !(_showReplies[postId] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Manage Forum Posts',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // Display the forum posts
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('forum_posts')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final posts = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    final DateTime postTime =
                        (post['timestamp'] as Timestamp).toDate();
                    final int repliesCount = post['replies'].length;
                    final List replies = post['replies'];

                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Post content
                            Text(
                              post['content'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            // Post metadata (author, time, division)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post['author'] == 'Admin'
                                          ? 'Posted by: Admin'
                                          : 'Posted by: ${post['author']} from ${post['division']}',
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      timeago.format(postTime),
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _removeForumPost(post.id),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Reply section with reply count
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.reply,
                                      color: Colors.blue),
                                  onPressed: () =>
                                      _toggleRepliesVisibility(post.id),
                                ),
                                Text(
                                  '$repliesCount Replies',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.blue),
                                ),
                              ],
                            ),
                            // Show replies if visible
                            if (_showReplies[post.id] ?? false)
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: replies.length,
                                itemBuilder: (context, replyIndex) {
                                  final reply = replies[replyIndex];
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, top: 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                            Icons.subdirectory_arrow_right,
                                            color: Colors.grey),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Reply from ${reply['author']}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                    color: Colors.blue),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(reply['reply']),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Add the "Enter your comments" section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your comments...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addForumPost,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
