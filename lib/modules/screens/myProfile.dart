// import 'package:coffee_shop/shared/network/users.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class MyProfile extends StatelessWidget {
//   const MyProfile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var user = FirebaseAuth.instance.currentUser;
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 300,
//           width: double.infinity,
//           child: Card(
//             shape: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: const BorderSide(color: Colors.transparent)),
//             color: subColor,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   const CircleAvatar(
//                     maxRadius: 70,
//                     backgroundImage:
//                         AssetImage('assets/images/new/userimage.png'),
//                   ),
//                   const SizedBox(height: 40),
//                   Text(
//                     '${user!.displayName}',
//                     style: const TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     '${user.email}',
//                     style: const TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:coffee_shop/shared/network/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/images/new/userimage.png'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '${user!.displayName}',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Software Engineer',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: subColor,
                ),
                title: Text(
                  '+1 123-456-7890',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: subColor,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: subColor,
                ),
                title: Text(
                  '${user.email}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: subColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
