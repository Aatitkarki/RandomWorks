import 'package:flutter/material.dart';
import 'package:listingApp/model/Users.dart';
import 'package:listingApp/services/Api.dart';
import 'package:listingApp/ui/postScreen.dart';
// import 'package:listingApp/ui/userPostScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> userList;
  bool isLoading = true;
  ApiServices apiServices = ApiServices();

  getData() async {
    userList = await apiServices.getUserData();
    print(userList.length);
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
        title: Text("Users"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: userList == null
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PostScreen(
                              userId: userList[index].id,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "${userList[index].name}",
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${userList[index].address.city}",
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
