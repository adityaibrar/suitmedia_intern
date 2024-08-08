import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suitmedia_intern/core/models/user_model.dart';
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _selectedUserName = '';

  String get name => _name;
  String get selectedUserName => _selectedUserName;

  List<User> users = [];
  List get _users => users;
  bool isLoading = false;
  int currentPage = 1;
  int perPage = 8;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setSelectedUserName(String userName) {
    _selectedUserName = userName;
    notifyListeners();
  }

  bool isPalindrome(String value) {
    String cleaned =
        value.replaceAll(RegExp(r'[^A-Za-z0-9]'), '').toLowerCase();
    return cleaned == cleaned.split('').reversed.join('');
  }

  ScrollController onScrollEvent() {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        nextPage();
      }
    });
    return scrollController;
  }

  void nextPage() {
    currentPage++;
    fetchUsers();
    notifyListeners();
  }

  Future fetchUsers() async {
    isLoading = true;
    var url = Uri.parse(
        'https://reqres.in/api/users?page=$currentPage&per_page=$perPage');

    try {
      final res = await http.get(url);
      final resData = jsonDecode(res.body);

      if (res.statusCode == 200) {
        isLoading = false;
        final data = resData['data'] as List<dynamic>;
        data.map((res) => _users.add(User.fromJson(res))).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
