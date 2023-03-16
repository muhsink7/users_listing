import 'package:flutter/material.dart';
import 'package:users_listing/components/networking.dart';
import 'package:users_listing/components/single_response.dart';

class SingleUser extends StatefulWidget {
  static String id = 'singleUser_screen';
  final int idArg;
  const SingleUser(this.idArg, {super.key});

  @override
  State<SingleUser> createState() => _SingleUserState();
}

class _SingleUserState extends State<SingleUser> {
  DataUser? dataUser;

  void getId() async {
    var singleResponse = await fetchId(widget.idArg);
    setState(() {
      dataUser = singleResponse.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("id : ${widget.idArg}");
    getId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Single User'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage("${dataUser?.avatar ?? ""}")),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${dataUser?.firstName ?? ""} ${dataUser?.lastName ?? ""}",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("${dataUser?.email ?? ""}"),
            ],
          ),
        ),
      ),
    );
  }
}
