import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffee_shop/layout/coffee_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/network/users.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isLogin = true;
  bool verify = false;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        toolbarHeight: 300,
        flexibleSpace: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/new/on_board1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: mainColor.withOpacity(0.3),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text.rich(
                    TextSpan(
                        text: _isLogin ? 'Welcome ' : 'Register ',
                        style: GoogleFonts.playfairDisplay(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: _isLogin ? 'back!' : 'now!!',
                            style: GoogleFonts.playfairDisplay(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 24),
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 18,left: 5),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    cursorColor: subColor,
                    style: TextStyle(color: blackColor),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email_outlined,
                        color: subColor,
                      ),
                      labelStyle: TextStyle(color: subColor),
                      labelText: 'Email',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: subColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: subColor,
                          width: 0.2,
                        ),
                      ),
                    ),
                    autocorrect: false,
                    enableSuggestions: true,
                    textCapitalization: TextCapitalization.none,
                    key: const ValueKey('email'),
                    validator: (val) {
                      if (val == null || val.isEmpty || !val.contains('@')) {
                        return "please enter a valid address";
                      }
                      return null;
                    },
                    onChanged: (val) {
                      emailController.text = val;
                      print(emailController.text);
                    },
                    onSaved: (val) {
                      emailController.text = val!;
                      print(emailController.text);
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                if (!_isLogin)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      cursorColor: subColor,
                      style: TextStyle(color: blackColor),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: subColor,
                        ),
                        labelStyle: TextStyle(color: subColor),
                        labelText: 'Username',
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: subColor,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: subColor,
                            width: 0.2,
                          ),
                        ),
                      ),
                      autocorrect: true,
                      enableSuggestions: true,
                      textCapitalization: TextCapitalization.words,
                      key: const ValueKey('username'),
                      validator: (val) {
                        if (val == null || val.isEmpty || val.length < 4) {
                          return "Please enter at least 4 characters";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        usernameController.text = val;
                        print(usernameController.text);
                      },
                      onSaved: (val) => usernameController.text = val!,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    key: const ValueKey('password'),
                    cursorColor: subColor,
                    style: TextStyle(color: blackColor),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.key,
                        color: subColor,
                      ),
                      labelStyle: TextStyle(color: subColor),
                      labelText: 'Password',
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: subColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: subColor,
                          width: 0.2,
                        ),
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty || val.length < 7) {
                        return "Password must be at least 7 characters";
                      }
                      return null;
                    },
                    onChanged: (val) {
                      passwordController.text = val;
                    },
                    onSaved: (val) => passwordController.text = val!,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                ),
                _isLogin
                    ? const SizedBox(height: 167)
                    : const SizedBox(height: 92),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              !_isLogin ? 'Sign In' : 'Sign Up',
                              style: TextStyle(
                                fontSize: 18,
                                color: subColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isLogin ? login() : signup();
                            });
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                subColor,
                              ),
                              fixedSize: MaterialStateProperty.all(
                                const Size(160, 70),
                              ),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                  ),
                                ),
                              )),
                          child: Text(
                            _isLogin ? 'Sign In' : 'Sign Up',
                            style: TextStyle(fontSize: 20, color: mainColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signup() async {
    if (_formKey.currentState!.validate()) {
      // myUsers.add(
      //   {
      //     'name': usernameController.text.trim(),
      //     'email': emailController.text.trim(),
      //     'password': passwordController.text.trim()
      //   },
      // );
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        setState(() {
          _isLogin = true;
        });
        FirebaseAuth.instance.currentUser!
            .updateDisplayName(usernameController.text);
        print(credential.user!.displayName);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: 'Error',
              body: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('The password provided is too weak.'),
              ))
            ..show();
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: 'Error',
              body: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Email already in use'),
              ))
            ..show();
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  login() async {
    if (_formKey.currentState!.validate()) {
      // for (int i = 0; i < myUsers.length; i++) {
      //   if (emailController.text.trim() == myUsers[i]['email'] &&
      //       passwordController.text.trim() == myUsers[i]['password']) {
      //     SharedPreferences prefs = await SharedPreferences.getInstance();
      //     prefs.setBool('loggedIn', true);
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(
      //       builder: (c) {
      //         return CoffeeLayout();
      //       },
      //     ));
      //     verify = true;
      //     break;
      //   }
      // }
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        print(credential.user!.displayName);
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setBool('loggedIn', true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (c) {
            return const CoffeeLayout();
          },
        ));
      } on FirebaseAuthException catch (e) {
        print(e.code);
        if (e.code == 'user-not-found') {
          print('not ok');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text("User not found"),
            backgroundColor: Theme.of(context).errorColor.withOpacity(0.5),
          ));
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
              context: context,
              dialogType: DialogType.info,
              animType: AnimType.rightSlide,
              title: 'Error',
              body: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Wrong password provided for that user.'),
              ))
            ..show();
          print('Wrong password provided for that user.');
        }
      }
    }
  }
}
// AppBar(
// elevation: 0,
// toolbarHeight: 300,
// flexibleSpace: PreferredSize(
// preferredSize: Size.fromHeight(120.0),
// child: Container(
// decoration: const BoxDecoration(
// image: DecorationImage(
// // image: AssetImage('assets/images/appbar1.jpg'),
// image: AssetImage('assets/images/new/on_board1.jpg'),
// fit: BoxFit.cover,
// ),
// ),
// ),
// ),
// ),
