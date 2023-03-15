import 'package:coffee_shop/shared/network/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: double.infinity,
          child: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
            color: subColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    maxRadius: 70,
                    backgroundImage:
                        AssetImage('assets/images/new/userimage.png'),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    '${user!.displayName}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${user.email}',
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
