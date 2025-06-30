import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          // ✅ Browser-like headers to bypass Cloudflare
          'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
              '(KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36',
          'Accept': 'application/json',
          'Connection': 'keep-alive',
        },
      );

      print('🛰️ Status Code: ${response.statusCode}');
      print('📦 Body: ${response.body}');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users (${response.statusCode})');
      }
    } catch (e) {
      print('❌ Exception during fetchUsers: $e');
      throw Exception('Failed to load users');
    }
  }
}
