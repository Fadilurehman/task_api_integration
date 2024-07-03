import 'package:assignment/models/comment.dart';
import 'package:assignment/models/post.dart';
import 'package:assignment/services/api_services.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  List<Post> _posts = [];
  Post? _selectedPost;
  List<Comment> _comments = [];
  bool _isLoading = false;

  List<Post> get posts => _posts;
  Post? get selectedPost => _selectedPost;
  List<Comment> get comments => _comments;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchPosts() async {
    _isLoading = true;
    notifyListeners();
    _posts = await _apiService.fetchPosts();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPostDetails(int postId) async {
    _isLoading = true;

    _selectedPost = await _apiService.fetchPost(postId);
    _comments = await _apiService.fetchComments(postId);
    _isLoading = false;
    notifyListeners();
  }
}
