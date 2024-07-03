import 'package:assignment/models/user.dart';
import 'package:assignment/services/api_services.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchUser(int userId) async {
    _isLoading = true;
    // notifyListeners();
    _user = await _apiService.fetchUser(userId);
    _isLoading = false;
    notifyListeners();
  }
}
