import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:users_listing/screens/gridview_screen.dart';
import 'package:users_listing/screens/usersList_screen.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static String id = 'login_screen';

  void login(String email, String password) async   {
    try{
      Response response = await post(
          Uri.parse("https://reqres.in/api/login"),
          body: {
            "email": email,
            "password": password
          }
      );
      print(response.body);
      if(response.statusCode == 200){
        var data = jsonDecode(response.body.toString());
        print(data["id"]);
        print("Login Successful");
      }
      else{
        print("Login Failed");
      }
    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4effb),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("User Login",textScaleFactor: 2,
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    controller: emailController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      labelText: 'eve.holt@reqres.in',
                      hintText: 'eve.holt@reqres.in',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 50,
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),

                      labelText: 'cityslicka',
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                  ),
                  onPressed: () {
                    login(emailController.text.toString(), passwordController.text.toString());
                    Navigator.pushNamed(context, GridViewScreen.id);
                  },

                  child: const Text('Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),

                  ),
                ),
            ],
          ),
      ),
    );
  }
}