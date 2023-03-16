import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class RegisterScreen extends StatelessWidget {
  static String id = 'registration_screen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void register(String email, String password) async {
    try {
      Response response = await post(
          Uri.parse("https://reqres.in/api/register"),
          body: {
            "email": email,
            "password": password
          }
      );
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data["token"]);
        print("Register Successful");
      }
      else {
        print("Register Failed");
      }
    }
    catch (e) {
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
            Text("User Register",textScaleFactor: 2,
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
                    color: Colors.lightGreen,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    labelText: 'email',
                    hintText: 'Enter your email',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(
                    color: Colors.lightGreen,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),

                    labelText: 'Password',
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
                  register(emailController.text.toString(), passwordController.text.toString());
                  Navigator.pushReplacementNamed(context, '/home');
                },

                child: const Text('Register',
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