//TODO: write the api links
//https://jsonplaceholder.typicode.com/users/
//https://jsonplaceholder.typicode.com/users/{user_id}/posts
//https://jsonplaceholder.typicode.com/posts/{post_id}/comments

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:listingApp/model/Comment.dart';
import 'package:listingApp/model/Post.dart';
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

  Future<List<Post>> getPostsData(int userId) async {
    String postApi = "https://jsonplaceholder.typicode.com/users/$userId/posts";
    List<Post> postList;
    var response = await http.get(postApi);
    List data = json.decode(response.body);
    postList = data.map((e) => Post.fromJson(e)).toList();
    return postList;
  }

  Future<List<Comment>> getCommentsData(int postId) async {
    print("getting comment data");
    String commentApi =
        "https://jsonplaceholder.typicode.com/posts/$postId/comments";
    List<Comment> commentList;
    var response = await http.get(commentApi);
    List data = json.decode(response.body);
    commentList = data.map((e) => Comment.fromJson(e)).toList();
    print(commentList.length);
    print("this is the length");
    return commentList;
  }
}
