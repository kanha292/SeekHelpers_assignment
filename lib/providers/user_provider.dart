import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  // ✅ Sirf ek baar API call karega
  Future<void> loadUsers() async {
    if (_users.isNotEmpty) return; // Already loaded, toh dubara mat laao

    try {
      _users = await ApiService.fetchUsers();
      notifyListeners();
    } catch (e) {
      print("Failed to fetch users: $e");
    }
  }

  // ✅ Naya user local list me add karna
  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  // (Optional) Reset list if needed
  void resetUsers() {
    _users = [];
    notifyListeners();
  }
}
