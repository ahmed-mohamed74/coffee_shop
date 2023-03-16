import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../layout/coffee_layout.dart';
import '../login_page.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen(isLogin, {Key? key}) : super(key: key);
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
      pages: [
        PageViewModel(
          title: 'first page',
          body: 'first page how are yooouuuu',
          image: buildImage('assets/images/new/empty-cart.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'second page',
          body: 'second page how are yooouuuu',
          image: buildImage('assets/images/new/manu.png'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'third page',
          body: 'third page how are yooouuuu',
          image: buildImage('assets/images/new/userimage.png'),
          decoration: getPageDecoration(),
        ),
      ],
      done: const Text(
        'ok',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      onDone: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => isLogin ? const CoffeeLayout() : LoginPage(),
          )),
      showSkipButton: true,
      skip: const Text('Skip'),
      showNextButton: true,
      next: Icon(Icons.arrow_forward),
      dotsDecorator: getDotsDecoration(),
          animationDuration: 600,
    ));
  }

  Widget? buildImage(String path) {
    return Center(
      child: Image.asset(
        path,
        width: 350,
      ),
    );
  }

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle:
            const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        bodyTextStyle: const TextStyle(fontSize: 20),
        imagePadding: const EdgeInsets.all(24),
        pageColor: mainColor,
      );

  DotsDecorator getDotsDecoration() => DotsDecorator(
    activeColor: subColor,
      color: Colors.red,
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));
}
