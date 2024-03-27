import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterzegoxloudtestvideocall/signinmodel.dart';
import 'package:http/http.dart' as http;



class SigninService {
  Future<SigninModel> signin(String userName, String pasword) async {
    var url = Uri.parse('https://iworkservice.btarge.com/Auth/Signin');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: jsonEncode(
        {'userName': userName, 'password': pasword, 'scope': ""},///scope: "erpApi"
      ),
    );
    if (response.statusCode == 200) {
      print('SigninService: ' + response.body);
      return SigninModel.fromJson(jsonDecode(response.body));
    } else {
      print(response.statusCode);
      throw Exception('Failed to load data!');
    }
  }
}
