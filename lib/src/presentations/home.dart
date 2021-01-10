import 'package:flutter/material.dart';
import 'package:instagram_clone/src/containers/auth/index.dart';
import 'package:instagram_clone/src/models/auth/index.dart';
import 'package:instagram_clone/src/presentations/home/home_page.dart';
import 'package:instagram_clone/src/presentations/login/login_page.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(builder: (BuildContext context, AppUser user) {
      if (user == null) {
        //Show login page
        return const LoginPage();
      } else {
        //Show gome page
        return const HomePage();
      }
    });
  }
}
