import 'package:flutter/material.dart';
import 'package:users_listing/screens/initial_screen.dart';
import 'package:users_listing/screens/login_screen.dart';
import 'package:users_listing/screens/register_screen.dart';
import 'package:users_listing/screens/singleUser_screen.dart';
import 'package:users_listing/screens/splash_screen.dart';
import 'package:users_listing/screens/usersList_screen.dart';

void main() {
  runApp(const UsersListing());
}

class UsersListing extends StatelessWidget {
  const UsersListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.id,
      onGenerateRoute: (settings) {
        var routes = <String, WidgetBuilder>{
          SplashScreen.id : (context) => SplashScreen(),
          InitialScreen.id : (context) => InitialScreen(),
          LoginScreen.id : (context) => LoginScreen(),
          RegisterScreen.id : (context) => RegisterScreen(),
          UsersList.id : (context) => UsersList(),
          SingleUser.id: (context) => SingleUser(settings.arguments as int),
        };
        WidgetBuilder builder = routes[settings.name] ?? (ctx) => InitialScreen();
        return MaterialPageRoute(builder: (ctx) => builder(ctx));
      }
    );
  }
}
