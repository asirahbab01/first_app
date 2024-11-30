import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:first_app/models/forum_model.dart'; // Import the model
import 'package:timeago/timeago.dart'
    as timeago; // Import timeago for relative time

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  final _postController = TextEditingController();

  Future<void> _addPost() async {
    if (_postController.text.isNotEmpty) {
      await ForumPost.addPost(_postController.text);
      _postController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agro-NGO Discussion Forum',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('forum_posts')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final posts = snapshot.data.docs
                    .map((doc) => ForumPost.fromDocument(doc))
                    .toList();
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostCard(post: posts[index]);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _postController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your problem...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addPost,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final ForumPost post;

  const PostCard({super.key, required this.post});

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool _showReplies = false; // Toggle to show/hide replies
  final TextEditingController _replyController = TextEditingController();

  Future<void> _toggleRepliesVisibility() async {
    setState(() {
      _showReplies = !_showReplies;
    });
  }

  Future<void> _addReply() async {
    await ForumPost.addReply(widget.post.id, _replyController.text);
    _replyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // Convert Firestore timestamp to DateTime
    final postDateTime = widget.post.timeStamp.toDate();
    // Use timeago to get relative time
    final timeAgo = timeago.format(postDateTime);
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.content,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(widget.post.author == 'Admin' ? 'Posted by: Admin' : 'Posted by: ${widget.post.author} from ${widget.post.division}',style: const TextStyle(fontSize: 12),),
            Text(
              timeAgo, // Display the time lapsed
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    widget.post.likes
                            .contains(FirebaseAuth.instance.currentUser?.uid)
                        ? Icons.thumb_up
                        : Icons.thumb_up_alt_outlined,
                    color: widget.post.likes
                            .contains(FirebaseAuth.instance.currentUser?.uid)
                        ? Colors.green
                        : Colors.grey,
                  ),
                  onPressed: () => ForumPost.likePost(widget.post.id),
                ),
                Text('${widget.post.likes.length}'),
                const SizedBox(width: 16),
                IconButton(
                  icon: Icon(
                    widget.post.dislikes
                            .contains(FirebaseAuth.instance.currentUser?.uid)
                        ? Icons.thumb_down
                        : Icons.thumb_down_alt_outlined,
                    color: widget.post.dislikes
                            .contains(FirebaseAuth.instance.currentUser?.uid)
                        ? Colors.red
                        : Colors.grey,
                  ),
                  onPressed: () => ForumPost.dislikePost(widget.post.id),
                ),
                Text('${widget.post.dislikes.length}'),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    _showReplies ? Icons.expand_less : Icons.expand_more,
                    color: Colors.blue,
                  ),
                  onPressed: _toggleRepliesVisibility,
                ),
                Text(widget.post.replies.length.toString()),
              ],
            ),
            if (_showReplies)
              ...widget.post.replies.map((reply) => Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                        'Reply from ${reply['author']}: ${reply['reply']}'),
                        
                  )),
            if (_showReplies)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _replyController,
                        decoration: const InputDecoration(
                          hintText: 'Reply...',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: _addReply,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
