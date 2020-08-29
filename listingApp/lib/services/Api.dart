import 'dart:convert';
import 'package:listingApp/Prefs%20keys/keys.dart';
import 'package:listingApp/model/Post.dart';
import 'package:listingApp/model/Users.dart';
import 'package:listingApp/model/Comment.dart';
import 'package:listingApp/services/OfflineService.dart';

import 'package:http/http.dart' as http;

class ApiServices {
  String userApi = "https://jsonplaceholder.typicode.com/users/";

  Future<List<User>> getUserData() async {
    String userApi = "https://jsonplaceholder.typicode.com/users/";
    List<User> userList;
    var response = await http.get(userApi);
    List data = json.decode(response.body);

    OfflineService.savetoPrefs(users, response.body);

    print(data[0]);
    userList = data.map((e) => User.fromJson(e)).toList();
    return userList;
  }

  Future<List<Post>> getPostData(int userId) async {
    String postApi = "https://jsonplaceholder.typicode.com/users/$userId/posts";
    List<Post> postList;
    var response = await http.get(postApi);
    List data = json.decode(response.body);

    OfflineService.savetoPrefs("$posts$userId", response.body);

    postList = data.map((e) => Post.fromJson(e)).toList();
    return postList;
  }

  Future<List<Comment>> getCommentdata(int postId) async {
    // print("comment data");
    String commentApi =
        "https://jsonplaceholder.typicode.com/posts/$postId/comments";
    List<Comment> commentList;
    var response = await http.get(commentApi);
    List data = json.decode(response.body);

    OfflineService.savetoPrefs("$comments$postId", response.body);

    commentList = data.map((e) => Comment.fromJson(e)).toList();
    return commentList;
  }
}
