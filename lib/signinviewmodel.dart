import 'package:flutter/material.dart';
import 'package:flutterzegoxloudtestvideocall/signinservice.dart';

class SigninViewModel extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SigninService signinService = SigninService();
  String username = '';
  bool isLogin = false;
  String userId = '';
var memberList = [
   'samir',
    'seymur',
    'nijat',
    'nadir',
 ];

  Future<void> signin(BuildContext context) async {
    await signinService
        .signin(usernameController.text, passwordController.text)
        .then((value) {
      if (value.accessToken != null) {
        // box.write('userId', value.userId);
        isLogin = true;
        username = value.userName!;
        userId = value.userId!;

        notifyListeners();
      } else {
        isLogin = false;
        notifyListeners();
      }
    });
  }
}
