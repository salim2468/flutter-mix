import 'package:flutter/material.dart';

import '../models/user_list_model.dart';

class UsersViewModel with ChangeNotifier {
  bool _loading = false;
  List<Users> _userList = [];

  bool get loading => _loading;
  List<Users> get usersList => _userList;

  setLoading(bool loading) {
    _loading = loading;
  }

  setUsersList(List<Users> userList) {
    _userList = userList;
  }
}
