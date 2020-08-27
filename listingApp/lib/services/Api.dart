//TODO: write the api links
//https://jsonplaceholder.typicode.com/users/
//https://jsonplaceholder.typicode.com/users/{user_id}/posts
//https://jsonplaceholder.typicode.com/posts/{post_id}/comments

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listingApp/model/Users.dart';

class ApiServices {
  String userAPI = "https://jsonplaceholder.typicode.com/users/";

  Future<List<User>> getUserData() async {
    String userAPI = "https://jsonplaceholder.typicode.com/users/";
    List<User> userList;
    var response = await http.get(userAPI);
    List data = json.decode(response.body);
    userList = data.map((json) => User.fromJson(json)).toList();
    return userList;
  }
}
