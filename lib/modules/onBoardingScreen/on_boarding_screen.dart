import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          title: 'Coffee House',
          body:
              'The Coffee House ordering app makes it incredibly simple for the customers to order.',
          image: buildImage('assets/images/new/on_board1.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Coffee House',
          body:
              'In just 4 steps a customer can find and order from the coffee shop. ',
          image: buildImage('assets/images/new/on_board1.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Coffee House',
          body:
              '1) Choose your coffee from the list\n2) Read the ingredients of the coffee and add it to your cart\n3) Choose how many orders you need then pay',
          image: buildImage('assets/images/new/on_board1.jpg'),
          decoration: getPageDecoration(),
        ),
        PageViewModel(
          title: 'Coffee House',
          body: 'That is it! The order is confirmed and ready for you to make',
          image: buildImage('assets/images/new/on_board1.jpg'),
          decoration: getPageDecoration(),
        ),
      ],
      done: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: mainColor,
        ),
        height: 60,
        width: 60,
        child: Center(
          child: Icon(
            Icons.done,
            color: blackColor,
            size: 35,
          ),
        ),
      ),
      onDone: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  isLogin ? const CoffeeLayout() : LoginPage())),
      showSkipButton: true,
      skip: const Text('Skip'),
      skipStyle: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(mainColor),
          textStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1))),
      showNextButton: true,
      next: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: mainColor,
        ),
        height: 60,
        width: 60,
        child: const Icon(Icons.arrow_forward),
      ),
      nextStyle: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(blackColor),
      ),
      dotsDecorator: getDotsDecoration(),
      animationDuration: 600,
      globalBackgroundColor: blackColor,
    ));
  }

  Widget? buildImage(String path) {
    return CircleAvatar(
      radius: 120,
      backgroundImage: AssetImage(path),
    );
  }

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: GoogleFonts.playfairDisplay(
          textStyle: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w600, color: mainColor),
        ),
        bodyTextStyle: const TextStyle(fontSize: 20, color: Colors.white54),
        imagePadding: const EdgeInsets.all(24),
        pageColor: blackColor,
      );

  DotsDecorator getDotsDecoration() => DotsDecorator(
      activeColor: mainColor,
      color: Colors.white54,
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ));
}
