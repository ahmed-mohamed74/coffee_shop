import 'package:coffee_shop/paymob_package/core/network/dio_helper.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'layout/coffee_layout.dart';
import 'modules/login_page.dart';

bool isLogin = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initDio();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: mainColor,
          scaffoldBackgroundColor: mainColor,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          )),
      debugShowCheckedModeBanner: false,
      // home: RegisterScreen(),
      home: isLogin ? const CoffeeLayout():LoginPage(),
    );
  }
}
