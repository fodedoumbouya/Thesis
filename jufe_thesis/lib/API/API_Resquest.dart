// ignore_for_file: file_names, camel_case_types

import 'dart:convert';

import 'package:jufe_thesis/DB/userModelJson/userModelJson.dart';
import 'package:http/http.dart' as http;

class API_Resquest {
  static const String host = "http://10.0.2.2:8080";

  Future<UserResponse> loginRequest(UserLoginRequest userRq) async {
    UserResponse userResponse;
    String url = "$host/getUserInfo";
    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(userRq.toJson()),
    );
    var jsonObject = jsonDecode(response.body);
    userResponse = UserResponse.fromJson(jsonObject);

    return userResponse;
  }

  Future<UserRegisterRequest> registerRequest(UserData userData) async {
    UserRegisterRequest userResponse;
    String uri = "$host/register";
    var response = await http.post(
      Uri.parse(uri),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(userData.toJson()),
    );
    var jsonObject = jsonDecode(response.body);
    userResponse = UserRegisterRequest.fromJson(jsonObject);

    return userResponse;
  }
}
