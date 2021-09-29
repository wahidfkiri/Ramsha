import 'dart:convert';
import 'dart:io';

import 'package:ramsha_wallet/models/user.dart';
import 'package:ramsha_wallet/contracts/login_activity_contact.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class LoginActivityPresenter {
  LoginActivityView view;
  LoginActivityPresenter(this.view);


  @override
  void success(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("api_token", token);
  }

  @override
  void destroy() => view = null;
  var status ;

  @override
  login(email, password) async {


    String MyUrl = '102.219.178.152/api/login';
    try {
      var response = await http.post(Uri.parse(MyUrl),
          headers: {"Accept": "application/json"},
          body: jsonEncode({
            "email": "$email",
            "password": "$password",
          }));
    } on SocketException {
      view?.toast("هنالك خطأ");
    }


  }
}