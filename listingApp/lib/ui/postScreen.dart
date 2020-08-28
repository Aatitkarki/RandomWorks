import 'package:flutter/material.dart';
import 'package:listingApp/model/Post.dart';
import 'package:listingApp/services/Api.dart';
import 'package:listingApp/ui/userPostScreen.dart';

class PostScreen extends StatefulWidget {
  final int userId;

  PostScreen({this.userId});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<PostScreen> {
  List<Post> postsList;
  bool isLoading = true;
  ApiServices apiServices = ApiServices();

  getData() async {
    postsList = await apiServices.getPostsData(widget.userId);
    print(postsList.length);
    setState(() {
      print("changing state");
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest PostScreen"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: postsList == null
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: postsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserPosts(
                                  postId: postsList[index].id,
                                  userPost: postsList[index],
                                )));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${postsList[index].title}",
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${postsList[index].body}",
                              maxLines: 2,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
