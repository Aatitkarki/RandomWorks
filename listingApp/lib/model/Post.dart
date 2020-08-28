class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(
        userId: parsedJson["userId"],
        id: parsedJson["id"],
        title: parsedJson["title"],
        body: parsedJson["body"]);
  }
}
