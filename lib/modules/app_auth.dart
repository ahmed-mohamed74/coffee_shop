import 'package:coffee_shop/layout/coffee_layout.dart';
import 'package:coffee_shop/modules/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppAuth extends StatefulWidget {
  const AppAuth({Key? key}) : super(key: key);

  @override
  State<AppAuth> createState() => _AppAuthState();
}

class _AppAuthState extends State<AppAuth> {
  late bool? loggedIn;
  bool initial = true;

  @override
  Widget build(BuildContext context) {
    if (initial) {
      SharedPreferences.getInstance().then((val) {
        setState(() {
          initial = false;
          loggedIn = val.getBool('loggedIn');
          print('$loggedIn');
        });
      });
      return CircularProgressIndicator();
    } else {
      if (loggedIn == null) {
        return LoginPage();
      } else {
        return CoffeeLayout();
      }
    }
  }
}
