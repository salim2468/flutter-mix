import 'dart:io';

import 'package:flutter_project5/users_list/models/user_list_model.dart';
import 'package:flutter_project5/utils/constants.dart';

import 'package:http/http.dart' as http;

import 'api_status.dart';

class UserServices {
  static Future<Object> getUsers() async {
    try {
      var url = Uri.parse(USER_LIST);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Sucess(code: 200, response: usersFromJson(response.body));
      }
      return Failure(code: 100, errorResponse: 'Received 102 status code');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'Received 101 status code');
    } catch (e) {
      Failure(code: 103, errorResponse: 'Unknown Erro');
    }
    return 'Nothing';
  }
}
