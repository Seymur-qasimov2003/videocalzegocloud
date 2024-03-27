import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'homepage.dart';
import 'management.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
           Text('Login Page'),

          ///text field for email
          TextField(
            controller: ref.watch(Signinriverpodprovider).usernameController,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),

          ///text field for password
          TextField(
            controller: ref.watch(Signinriverpodprovider).passwordController,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),

          ///button for login
          ElevatedButton(
            onPressed: () async {
             await ref.read(Signinriverpodprovider).signin(context);
              if (ref.watch(Signinriverpodprovider).isLogin) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage()));
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
