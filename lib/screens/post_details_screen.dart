import 'package:assignment/provider/post_provider.dart';
import 'package:assignment/provider/user_provider.dart';
import 'package:assignment/screens/user_datails_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDetailScreen extends StatelessWidget {
  final int postId;

  const PostDetailScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: FutureBuilder(
        future: Provider.of<PostProvider>(context, listen: false)
            .fetchPostDetails(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching post details'));
          } else {
            return Consumer2<PostProvider, UserProvider>(
              builder: (context, postProvider, userProvider, child) {
                final post = postProvider.selectedPost!;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Text(post.body),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          userProvider.fetchUser(post.userId).then((_) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetailScreen(userId: post.userId),
                              ),
                            );
                          });
                        },
                        child: Text('Author: User ${post.userId}',
                            style: const TextStyle(color: Colors.blue)),
                      ),
                      const SizedBox(height: 16),
                      const Text('Comments',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      ...postProvider.comments.map((comment) {
                        return Card(
                          elevation: 4,
                          child: ListTile(
                            title: Text(comment.name),
                            subtitle: Text(comment.body),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
