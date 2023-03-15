import 'dart:ffi';

import 'package:flutter/material.dart';

class Drink {
  String drinkName;
  String type;
  String description;
  String image;
  String price;
  double rate;
  List<String> ingredients;

  Drink({
    required this.ingredients,
    required this.drinkName,
    required this.type,
    required this.description,
    required this.image,
    required this.price,
    required this.rate,
  });
}
