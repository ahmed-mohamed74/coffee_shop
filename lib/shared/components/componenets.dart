import 'dart:math';

import 'package:animations/animations.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cubit/cubit.dart';
import '../../modules/screens/cart_screen.dart';
import '../../modules/screens/drink_screen.dart';
import '../network/users.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

class defaultCard extends StatelessWidget {
  int index;
  int categoryIndex;
  bool isSearch;

  defaultCard({
    super.key,
    required this.index,
    required this.categoryIndex,
    this.isSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    const transitionType = ContainerTransitionType.fadeThrough;
    var cubit = AppCubit.get(context);
    return OpenContainer(
      closedShape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20),
      ),
      openColor: mainColor,
      closedColor: mainColor,
      middleColor: mainColor,
      transitionDuration: const Duration(milliseconds: 1500),
      transitionType: transitionType,
      closedBuilder: (BuildContext context, VoidCallback openContainer) =>
          InkWell(
              onTap: openContainer,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  width: 150,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 12,
                              offset: const Offset(
                                  0, 13), // changes position of shadow
                            ),
                          ],
                        ),
                        padding:
                            const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            height: 135,
                            width: double.infinity,
                            isSearch
                                ? '${cubit.searchDrinks[index]['image']}'
                                : '${drinks[categoryIndex][index].image}',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            title: Text(
                              isSearch
                                  ? '${cubit.searchDrinks[index]['drinkName']}'
                                  : drinks[categoryIndex][index].drinkName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Text(
                              isSearch
                                  ? '${cubit.searchDrinks[index]['description']}'
                                  : drinks[categoryIndex][index].description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text.rich(
                              TextSpan(
                                  text: '\$ ',
                                  style: TextStyle(
                                      color: subColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: isSearch
                                          ? '${cubit.searchDrinks[index]['price']}'
                                          : '${drinks[categoryIndex][index].price}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              width: 33,
                              height: 33,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(subColor),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  cart.add(
                                    {
                                      'name':
                                          '${drinks[categoryIndex][index].drinkName}',
                                      'image':
                                          '${drinks[categoryIndex][index].image}',
                                      'price':
                                          '${drinks[categoryIndex][index].price}'
                                    },
                                  );
                                  AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      animType: AnimType.rightSlide,
                                      title: 'Done',
                                      body: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                              'Your drink has been added successfully.',
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
                                child: Icon(
                                  Icons.add,
                                  size: 16,
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
      openBuilder:
          (BuildContext context, void Function({Object? returnValue}) action) =>
              DrinkScreen(categoryIndex, index),
    );
  }
}

class SpecialCard extends StatelessWidget {
  int randomCategory = Random().nextInt(2);
  int randomDrink = Random().nextInt(5);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, DrinkScreen(randomCategory, randomDrink));
      },
      child: Card(
        margin: const EdgeInsets.all(12),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Banner(
          message: '50%',
          location: BannerLocation.topEnd,
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
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 12,
                        offset:
                            const Offset(0, 13), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      height: 135,
                      width: 120,
                      '${drinks[randomCategory][randomDrink].image}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 170,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          '${drinks[randomCategory][randomDrink].drinkName} You\nMust Try It !',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Flexible(
                      child: SizedBox(
                        width: 130,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          '${drinks[randomCategory][randomDrink].description}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 20),
                      child: Row(
                        children: [
                          Text.rich(
                            TextSpan(
                                text: '\$ ',
                                style: TextStyle(
                                    color: subColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        '${drinks[randomCategory][randomDrink].price}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  )
                                ]),
                          ),
                          const SizedBox(width: 40),
                          Icon(
                            Icons.tag_faces_sharp,
                            color: subColor,
                            size: 40,
                          ),
                        ],
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
}

PreferredSizeWidget? buildAppBar() {
  return AppBar(
    backgroundColor: mainColor,
    title: Text.rich(
      TextSpan(
          text: 'Coffee',
          style: GoogleFonts.playfairDisplay(
            textStyle: TextStyle(
                color: blackColor, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'house',
              style: TextStyle(
                  color: subColor, fontWeight: FontWeight.w300, fontSize: 22),
            )
          ]),
    ),
    centerTitle: true,
    elevation: 0,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Image.asset(
            "assets/images/new/manu.png",
            height: 50,
            width: 70,
          ),
// const Icon(
//   Icons.menu_outlined,
//   color: Colors.black,
//   size: 35, // Changing Drawer Icon Size
// ),
          onPressed: () {
// Scaffold.of(context).openDrawer();
            ZoomDrawer.of(context)!.toggle();
          },
// tooltip: MaterialLocalizations.of(context)
//     .openAppDrawerTooltip,
        );
      },
    ),
    actions: [
      OpenContainer(
        openColor: mainColor,
        closedColor: mainColor,
        middleColor: mainColor,
        transitionDuration: const Duration(milliseconds: 1500),
// transitionType: transitionType,
        closedBuilder: (BuildContext context, VoidCallback openContainer) =>
            InkWell(
          onTap: openContainer,
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
          ),
        ),
        openBuilder: (BuildContext context,
                void Function({Object? returnValue}) action) =>
            const CartScreen(),
      ),
    ],
  );
}
