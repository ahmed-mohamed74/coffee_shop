import 'package:coffee_shop/paymob_package/core/network/constant.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';

import '../../../layout/coffee_layout.dart';

class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: const Text('Reference Code'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoffeeLayout(),
                  ));
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'You should go to our coffee to get your drink..',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'This is the reference code :',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(18.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black,
                ),
                child: Center(
                    child: Text(
                  ApiContest.refCode.isEmpty
                      ? 'nothing...'
                      : ApiContest.refCode,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: subColor,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
