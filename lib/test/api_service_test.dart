import 'package:assignment/models/comment.dart';
import 'package:assignment/models/post.dart';
import 'package:assignment/models/user.dart';
import 'package:assignment/services/api_services.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

void main() {
  final ApiService apiService = ApiService();

  test('Fetch posts', () async {
    final posts = await apiService.fetchPosts();
    expect(posts, isA<List<Post>>());
    expect(posts.isNotEmpty, true);
  });

  test('Fetch post', () async {
    final post = await apiService.fetchPost(1);
    expect(post, isA<Post>());
    expect(post.id, 1);
  });

  test('Fetch comments', () async {
    final comments = await apiService.fetchComments(1);
    expect(comments, isA<List<Comment>>());
    expect(comments.isNotEmpty, true);
  });

  test('Fetch user', () async {
    final user = await apiService.fetchUser(1);
    expect(user, isA<User>());
    expect(user.id, 1);
  });
}
