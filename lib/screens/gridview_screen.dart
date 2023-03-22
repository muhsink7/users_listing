import 'package:flutter/material.dart';
import 'package:users_listing/components/user_response.dart';
import 'package:users_listing/components/networking.dart';
import 'package:users_listing/screens/singleUser_screen.dart';

class GridViewScreen extends StatefulWidget {
  static String id = 'gridview_screen';

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final scrollController = ScrollController();
  bool isLoading = false;
  int page = 1;
  List<Data> data = [];
  bool isListView = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_userResponse);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Users List',
                style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isListView = true;
                            });
                          },
                          child: Icon(Icons.list_rounded))),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isListView = false;
                      });
                    },
                    child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Icon(Icons.grid_view_rounded)),
                  ),
                ],
              ),
            ),
          ),
          isListView == false
              ? Expanded(
                  child: GridView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: isLoading ? data.length + 1 : data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      print(
                          "index : $index userResponse.length : ${data.length}");
                      if (index < data.length) {
                        return SizedBox(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  var currentId = data[index].id;
                                  Navigator.pushNamed(
                                    context,
                                    SingleUser.id,
                                    arguments: currentId ?? 0,
                                  );
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        // Text("${data[index].id ?? ""}"),
                                        CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                                "${data[index].avatar ?? ""}")),
                                        Text(
                                          "${data[index].firstName ?? ""} ${data[index].lastName ?? ""}",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("${data[index].email ?? ""}"),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    shrinkWrap: true,
                    itemCount: isLoading ? data.length + 1 : data.length,
                    itemBuilder: (context, index) {
                      print(
                          "index : $index userResponse.length : ${data.length}");
                      if (index < data.length) {
                        return SizedBox(
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  var currentId = data[index].id;
                                  Navigator.pushNamed(
                                    context,
                                    SingleUser.id,
                                    arguments: currentId ?? 0,
                                  );
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("${data[index].id ?? ""}"),
                                        CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                                "${data[index].avatar ?? ""}")),
                                        Column(
                                          children: [
                                            Text(
                                              "${data[index].firstName ?? ""} ${data[index].lastName ?? ""}",
                                              style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text("${data[index].email ?? ""}"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
        ],
      ),
    );
  }

  void getData() async {
    var userData = await fetchData(page);

    setState(() {
      data.clear();
      data.addAll(userData.data ?? []);
    });
  }

  Future<void> _userResponse() async {
    if (isLoading) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoading = true;
        page++;
      });
      var userData = await fetchData(page);
      setState(() {
        data.addAll(userData.data ?? []);
        isLoading = false;
      });
    }
  }
}
