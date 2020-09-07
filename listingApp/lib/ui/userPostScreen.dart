import 'package:flutter/material.dart';
import 'package:listingApp/model/Post.dart';
import 'package:listingApp/services/Api.dart';
import 'package:listingApp/model/Comment.dart';
// import 'package:listingApp/services/OfflineService.dart';
// import 'package:listingApp/Prefs%20keys/keys.dart';

class UserPostScreen extends StatefulWidget {
  final Post userPost;
  final int postId;

  UserPostScreen({this.userPost, this.postId});

  @override
  _UserPostScreenState createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  List<Comment> commentList = [];
  bool isloading = true;
  ApiServices apiServices = ApiServices();

  getData() async {
    commentList = await apiServices.getCommentdata(widget.postId);

    setState(() {
      isloading = false;
      // print("this is the after the await");
      // print(commentList.length);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comment Section"),
        centerTitle: true,
      ),
      body: Container(
        child: commentList == null
            ? CircularProgressIndicator()
            : Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(30.0, 15.0, 20.0, 15.0),
                    height: 180.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(5, 5),
                            blurRadius: 1.0,
                            spreadRadius: 1.0)
                      ],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.userPost.body,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Comments",
                      maxLines: 2,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: commentList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "By ${commentList[index].email}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "${commentList[index].body}",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
