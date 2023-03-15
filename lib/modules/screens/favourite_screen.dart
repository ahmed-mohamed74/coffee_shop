import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text(
            'Favourite screen',
            style: TextStyle(color: subColor),
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
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, top: 20, bottom: 15),
                      child: Text(
                        'My Favourites',
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
                          var product = favourites[index];
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
                                                                  color: subColor,
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
                                                        favourites
                                                            .removeAt(index);
                                                      });
                                                    },
                                                    icon: Icon(
                                                      color: Colors.red,
                                                      Icons.favorite,
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
                                                width: 150,
                                                child: Text(
                                                  product['desc'],
                                                  style: TextStyle(
                                                    color: Colors.white54,
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ),
                                            ),
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
                        itemCount: favourites.length,
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
