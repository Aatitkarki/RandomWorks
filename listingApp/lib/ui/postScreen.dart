import 'package:flutter/material.dart';
import 'package:listingApp/model/Post.dart';
import 'package:listingApp/services/Api.dart';
import 'package:listingApp/ui/userPostScreen.dart';
import 'package:listingApp/services/OfflineService.dart';
import 'package:listingApp/Prefs%20keys/keys.dart';

class PostScreen extends StatefulWidget {
  final int userId;

  PostScreen({
    this.userId,
  });

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Post> postList;
  bool isLoading = true;
  ApiServices apiServices = ApiServices();

  getData() async {
    postList = await apiServices.getPostData(widget.userId);
    setState(() {
      // print('asdadasd');
      isLoading = false;
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
        title: Text("Latest PostScreen"),
        centerTitle: true,
      ),
      body: Container(
        child: isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          OfflineService.getFromPrefs("$posts.userId");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => UserPostScreen(
                                postId: postList[index].id,
                                userPost: postList[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(30.0, 15.0, 20.0, 15.0),
                          height: 140.0,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Title : ${postList[index].title}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${postList[index].body}",
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
