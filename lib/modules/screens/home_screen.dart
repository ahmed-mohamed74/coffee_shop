import 'package:coffee_shop/shared/components/componenets.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 8),
              child: Text(
                'Find the best\ncoffee for you',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 90,
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                textAlign: TextAlign.left,
                cursorColor: Colors.grey,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  labelStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                  labelText: 'Find your coffee ..',
                  fillColor: const Color(0xFF131313),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23.0),
                  ),
                ),
                maxLines: 1,
                controller: searchController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  print(value);
                  AppCubit.get(context).getSearch(value);
                },
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: drinks.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      print('category taped');
                      cubit.categoryIndex = index;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          index == 0
                              ? 'Hot Drinks'
                              : index == 1
                                  ? 'Cold Drinks'
                                  : 'Hot Teas',
                          style: TextStyle(
                            color: index == cubit.categoryIndex
                                ? spColor
                                : Colors.grey.withOpacity(0.7),
                            fontWeight: index == cubit.categoryIndex
                                ? FontWeight.w700
                                : FontWeight.w500,
                            fontSize: index == cubit.categoryIndex ? 17 : 16,
                          ),
                        ),
                      ),
                      index == cubit.categoryIndex
                          ? CircleAvatar(
                              radius: 4,
                              backgroundColor: spColor,
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.black,
              margin: const EdgeInsets.all(15.0),
              height: 270,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: searchController.text.isEmpty
                    ? drinks[cubit.categoryIndex].length
                    : cubit.searchDrinks.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: defaultCard(
                    index: index,
                    categoryIndex: cubit.categoryIndex,
                    isSearch: searchController.text.isEmpty ? false : true,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Special for you',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SpecialCard(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
