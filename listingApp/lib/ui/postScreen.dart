import 'package:flutter/material.dart';
import 'package:listingApp/model/Post.dart';
import 'package:listingApp/services/Api.dart';
import 'package:listingApp/story.dart';
import 'package:listingApp/model/Comment.dart';
import 'package:listingApp/ui/userPostScreen.dart';
import 'package:listingApp/services/OfflineService.dart';
import 'package:listingApp/Prefs%20keys/keys.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PostScreen extends StatefulWidget {
  final int userId;
  final Post userPost;
  final int postId;

  PostScreen({
    this.userId,
    this.userPost,
    this.postId,
  });

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List<Story> _stories = [
    Story(
      "https://images.pexels.com/photos/4407897/pexels-photo-4407897.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "Jessica",
    ),
    Story(
      "https://images.pexels.com/photos/4407688/pexels-photo-4407688.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "Jason",
    ),
    Story(
      "https://images.pexels.com/photos/4673418/pexels-photo-4673418.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "Sujan",
    ),
    Story(
      "https://images.pexels.com/photos/1933873/pexels-photo-1933873.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "Rohan",
    ),
    Story(
      "https://images.pexels.com/photos/4022812/pexels-photo-4022812.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "Lasta",
    ),
    Story(
      "https://images.pexels.com/photos/2673365/pexels-photo-2673365.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "Sayeet",
    ),
    Story(
      "https://images.pexels.com/photos/3750698/pexels-photo-3750698.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "Aliza",
    ),
    Story(
      "https://images.pexels.com/photos/4330308/pexels-photo-4330308.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "Jagadish",
    ),
    Story(
      "https://images.pexels.com/photos/4394790/pexels-photo-4394790.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
      "Silvanna",
    ),
  ];

  List<Post> postList;
  List<Comment> commentList;
  bool isLoading = true;
  ApiServices apiServices = ApiServices();

  getData() async {
    postList = await apiServices.getPostData(widget.userId);
    commentList = await apiServices.getCommentdata(widget.postId);
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
        elevation: 0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "User",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Feather.camera,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesome.send_o,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stories",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Watch All",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                height: 120,
                child: ListView.builder(
                  itemCount: _stories.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (ctx, i) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              width: 4,
                              color: Color(0xFF8e44ad),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: Image(
                              image: NetworkImage(_stories[i].image),
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Text(_stories[i].name),
                      ],
                    );
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _stories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image(
                                        image:
                                            NetworkImage(_stories[index].image),
                                        width: 40,
                                        height: 40,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _stories[index].name,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(SimpleLineIcons.options),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                          Image(
                            image: NetworkImage(_stories[index].image),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(FontAwesome.heart_o),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(FontAwesome.comment_o),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(FontAwesome.send_o),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(FontAwesome.bookmark_o),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.0,
                            ),
                            child: RichText(
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Liked By",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Ramon,",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Invoker,",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  Zeus,",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  and",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "  122 others,",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          //caption section

                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            child: RichText(
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: postList[index].title,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: postList[index].body,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  // TextSpan(
                                  //   text: commentList[index].email,
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //     color: Colors.black,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
