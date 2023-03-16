import 'package:flutter/material.dart';
import 'package:users_listing/screens/login_screen.dart';
import 'package:users_listing/screens/register_screen.dart';

class InitialScreen extends StatelessWidget {
  static String id = 'initial_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe4effb),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "User Listing",
              textScaleFactor: 2,
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id );
                },

                child: const Text('Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),

              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
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
