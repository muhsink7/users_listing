import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:users_listing/components/user_response.dart';
import 'dart:async';
import 'package:users_listing/components/single_response.dart';

Future<UserResponse> fetchData(int page) async {
  final response = await http
      .get(Uri.parse('https://reqres.in/api/users?page=$page'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Users');
  }
}

Future<SingleResponse> fetchId(int id) async {
  final response = await http
      .get(Uri.parse('https://reqres.in/api/users/$id'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return SingleResponse.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Users');
  }
}