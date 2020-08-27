//TODO: write the api links
//https://jsonplaceholder.typicode.com/users/
//https://jsonplaceholder.typicode.com/users/{user_id}/posts
//https://jsonplaceholder.typicode.com/posts/{post_id}/comments

import 'package:http/http.dart' as http;

class ApiServices {
  String userAPI = "https://jsonplaceholder.typicode.com/users/";
  Future<void> getUserData() {
    var response = http.get(userAPI);
    print(response);
  }
}
