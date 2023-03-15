import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../paymob_package/modules/screens/register_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    if (cart.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35.0, top: 20, bottom: 15),
                child: Text(
                  'My Cart',
                  style: TextStyle(
                      color: subColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1),
                ),
              ),
              Flexible(
                flex: 5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/new/empty-cart.png',
                        width: 150,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Your Cart is Empty!!',
                          style: TextStyle(color: subColor,fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: blackColor,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text.rich(
                                  TextSpan(
                                      text: '\$ ',
                                      style: TextStyle(
                                          color: subColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '0',
                                          style: TextStyle(
                                              color: blackColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: 90,
                            width: 220,
                            child: MaterialButton(
                              splashColor: Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              onPressed: () {
                                AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.infoReverse,
                                    animType: AnimType.rightSlide,
                                    title: 'Warning!!',
                                    body: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'The cart is empty...',
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'okay',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              )),
                                        ],
                                      ),
                                    )).show();
                              },
                              color: blackColor,
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                    color: subColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, Object? state) {},
          builder: (BuildContext context, state) {
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: mainColor,
                foregroundColor: blackColor,
                elevation: 0,
              ),
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, top: 20, bottom: 15),
                      child: Text(
                        'My Cart',
                        style: TextStyle(
                            color: subColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          var product = cart[index];
                          return BlocProvider(
                            create: (context) => AppCubit(),
                            child: BlocConsumer<AppCubit, AppStates>(
                              listener: (context, state) {},
                              builder: (BuildContext context, Object? state) {
                                var counterCubit = AppCubit.get(context);
                                return Card(
                                  margin: const EdgeInsets.all(12),
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.black87,
                                              Colors.black87,
                                              Colors.black,
                                            ])),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.4),
                                                spreadRadius: 2,
                                                blurRadius: 12,
                                                offset: const Offset(0,
                                                    13), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          padding: const EdgeInsets.all(8),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.asset(
                                              height: 135,
                                              width: 120,
                                              '${product['image']}',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 10.0, left: 10),
                                                      child: SizedBox(
                                                        width: 120,
                                                        child: Text(
                                                          product['name'],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 19,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                          maxLines: 2,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 6),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(3.0),
                                                      child: SizedBox(
                                                        height: 25,
                                                        width: 110,
                                                        child: Text.rich(
                                                          TextSpan(
                                                              text: '\$ ',
                                                              style: TextStyle(
                                                                  color:
                                                                      subColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18),
                                                              children: <
                                                                  TextSpan>[
                                                                TextSpan(
                                                                  text:
                                                                      '${product['price']}',
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      fontSize:
                                                                          18),
                                                                )
                                                              ]),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 20),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  child: IconButton(
                                                    color: subColor,
                                                    onPressed: () {
                                                      setState(() {
                                                        cart.removeAt(index);
                                                        cubit.productCounter -=
                                                            counterCubit
                                                                    .productCounter *
                                                                double.parse(
                                                                    product[
                                                                        'price']);
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.delete_forever,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                width: 167,
                                                height: 40,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.add,
                                                        color: Colors.black,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          counterCubit
                                                              .incrementCounter();
                                                          cubit.productCounter += 1 *
                                                              double.parse(
                                                                  product[
                                                                      'price']);
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(width: 15),
                                                    Text(
                                                      '${counterCubit.productCounter.toInt()}',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15),
                                                    IconButton(
                                                      icon: Icon(
                                                        Icons.remove,
                                                        color: Colors.black,
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          counterCubit
                                                              .decrementCounter();
                                                          cubit.productCounter -= 1 *
                                                              double.parse(
                                                                  product[
                                                                      'price']);
                                                        });
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          height: 5,
                          color: subColor.withOpacity(0.5),
                        ),
                        itemCount: cart.length,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: blackColor,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text.rich(
                                        TextSpan(
                                            text: '\$ ',
                                            style: TextStyle(
                                                color: subColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: cubit.productCounter
                                                    .toStringAsFixed(2),
                                                style: TextStyle(
                                                    color: blackColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 20),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: 90,
                                  width: 220,
                                  child: MaterialButton(
                                    splashColor: blackColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    onPressed: () {
                                      print((cubit.productCounter * 100)
                                          .toStringAsFixed(2));
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RegisterScreen(
                                              (cubit.productCounter * 100)
                                                  .toStringAsFixed(2),
                                            ),
                                          ));
                                    },
                                    color: blackColor,
                                    child: Text(
                                      'Buy Now',
                                      style: TextStyle(
                                          color: subColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
