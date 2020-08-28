import 'package:flutter/material.dart';
import 'package:listingApp/model/Comment.dart';
import 'package:listingApp/model/Post.dart';
import 'package:listingApp/services/Api.dart';

class UserPosts extends StatefulWidget {
  final Post userPost;
  final int postId;

  UserPosts({this.userPost, this.postId});
  @override
  _UserPostsState createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  List<Comment> commentList;
  bool isLoading = true;
  ApiServices apiServices = ApiServices();

  getData() async {
    print("before changing state");
    commentList = await apiServices.getCommentsData(widget.postId);

    setState(() {
      print("changing state");
      isLoading = false;
    });
    print("this is the after the await");
    print(commentList.length);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.userPost.title),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: commentList == null
              ? CircularProgressIndicator()
              : Column(
                  children: [
                    Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.userPost.body,
                            style: TextStyle(fontSize: 25),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Comments",
                            maxLines: 2,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: commentList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                children: [
                                  Text(
                                    commentList[index].email,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    commentList[index].body,
                                    style: TextStyle(fontSize: 18),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
