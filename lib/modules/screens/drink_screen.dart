import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:coffee_shop/modules/screens/cart_screen.dart';
import 'package:coffee_shop/shared/components/componenets.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class DrinkScreen extends StatelessWidget {
  int index;
  int categoryIndex;

  DrinkScreen(this.categoryIndex, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, Object? state) {},
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
          var x = drinks[categoryIndex][index];
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                width: double.infinity,
                                height: 450,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    drinks[categoryIndex][index].image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                  width: 393, // wants editttttttttttttttt
                                  height: 100,
                                  bottom: 0,
                                  child: BlurryContainer(
                                    blur: 4,
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.1),
                                    elevation: 2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              drinks[categoryIndex][index]
                                                  .drinkName,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                            Text(
                                              drinks[categoryIndex][index]
                                                  .description,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 14,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: spColor,
                                                  ),
                                                  Text(
                                                    '${drinks[categoryIndex][index].rate}',
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox.fromSize(
                                                  size: const Size(35, 40),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Material(
                                                      color: Colors.black,
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.grey,
                                                        onTap: () {},
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.coffee,
                                                              size: 15,
                                                              color: spColor,
                                                            ),
                                                            // <-- Icon
                                                            const Text(
                                                              "Coffee",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200),
                                                            ),
                                                            // <-- Text
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 14),
                                                SizedBox.fromSize(
                                                  size: const Size(35, 40),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Material(
                                                      color: Colors.black,
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.grey,
                                                        onTap: () {},
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.water_drop,
                                                              size: 15,
                                                              color: spColor,
                                                            ),
                                                            // <-- Icon
                                                            const Text(
                                                              "Milk",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w200),
                                                            ),
                                                            // <-- Text
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            SizedBox.fromSize(
                                              size: const Size(90, 30),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Material(
                                                  color: Colors.black,
                                                  child: InkWell(
                                                    splashColor: Colors.grey,
                                                    onTap: () {},
                                                    child: const Center(
                                                      child: Text(
                                                        "Medium Roasted",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w200),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                              Positioned(
                                  top: 20,
                                  right: 20,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    child: IconButton(
                                      onPressed: () {
                                        if (!cubit.isFavourite) {
                                          favourites.add({
                                            'name':
                                                '${drinks[categoryIndex][index].drinkName}',
                                            'image':
                                                '${drinks[categoryIndex][index].image}',
                                            'price':
                                                '${drinks[categoryIndex][index].price}',
                                            'desc':
                                                '${drinks[categoryIndex][index].description}'
                                          });
                                        } else {
                                          favourites.removeLast();
                                        }
                                        cubit.favouriteMode();
                                      },
                                      icon: Icon(
                                        cubit.isFavourite
                                            ? Icons.favorite_outlined
                                            : Icons.favorite_outline_sharp,
                                        color: cubit.isFavourite
                                            ? Colors.red
                                            : Colors.black,
                                        size: 25,
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  width: 40,
                                  height: 40,
                                  top: 20,
                                  left: 20,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        end: Alignment.center,
                                        colors: [
                                          Colors.black54,
                                          Colors.black87,
                                          Colors.black87,
                                          Colors.black
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.grey.withOpacity(0.6),
                                        size: 15,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                          ListTile(
                            title: const Text(
                              'Ingredients',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(10),
                              height: 110,
                              width: 300,
                              child: ListView.builder(
                                itemBuilder: (ctx, i) => Card(
                                  color: spColor,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Text('${x.ingredients[i]}'),
                                  ),
                                ),
                                itemCount: x.ingredients.length,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 30, right: 30, top: 5),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Size',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 5),
                              ToggleButtons(
                                direction: Axis.horizontal,
                                onPressed: (int j) {
                                  cubit.toggleButton(j);
                                },
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                selectedBorderColor: spColor,
                                selectedColor: spColor,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                                fillColor: Colors.black,
                                color: Colors.white70,
                                constraints: const BoxConstraints(
                                  minHeight: 35.0,
                                  minWidth: 100.0,
                                ),
                                isSelected: cubit.selectedSize,
                                children: cubit.sizes,
                              ),
                            ],
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
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  const Text(
                                    'Price',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text.rich(
                                    TextSpan(
                                        text: '\$ ',
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(208, 122, 68, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '${drinks[categoryIndex][index].price}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(20),
                              height: 90,
                              width: 220,
                              child: MaterialButton(
                                splashColor: Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  cart.add({
                                    'name':
                                        '${drinks[categoryIndex][index].drinkName}',
                                    'image':
                                        '${drinks[categoryIndex][index].image}',
                                    'price':
                                        '${drinks[categoryIndex][index].price}'
                                  });
                                  navigateTo(context, const CartScreen());
                                },
                                color: spColor,
                                child: const Text(
                                  'Add to Cart',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
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
