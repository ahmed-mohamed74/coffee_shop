import 'dart:ui';

import '../components/drink.dart';

List<Map> myUsers = [
  {'name': 'alii', 'email': 'ali@gmail.com', 'password': '12345678'},
  {'name': 'omar', 'email': 'omar@gmail.com', 'password': '12345678'},
  {'name': 'ahmed', 'email': 'ahmed@gmail.com', 'password': '12345678'},
];
Color spColor = const Color.fromRGBO(208, 122, 68, 1);
Color mainColor = const Color.fromRGBO(235, 219, 204, 1);
Color subColor = const Color.fromRGBO(197, 148, 80, 1);
Color oneTimeColor = const Color.fromRGBO(218, 202, 189, 1);
Color blackColor = const Color.fromRGBO(34, 35, 37, 1);

List drinks = [
  hotDrinks,
  icedDrinks,
  hotTeas,
];
List<Drink> hotDrinks = [
  Drink(
    image: 'assets/images/cl1.jpg',
    type: 'Hot Coffees',
    drinkName: 'Caffè Latte',
    description: 'creamy body and frothy milk',
    price: '7.25',
    rate: 4.5,
    ingredients: [
      '3 ounces (2 shots) hot, freshly brewed espresso',
      '8-10 ounces of steamed whole milk',
      '1/4 teaspoon cinnamon sugar mix, optional',
    ],
  ),
  Drink(
    image: 'assets/images/wm1.jpg',
    type: 'Hot Coffees',
    drinkName: 'Chocolate Mocha',
    description: 'White Chocolate',
    price: '12.40',
    rate: 4.5,
    ingredients: [
      '1 cup of brewed coffee',
      '4 tablespoons (1/4 cup) of your favorite chocolate bar shavings or cocoa powder',
      '1/2 cup of cream or milk',
    ],
  ),
  Drink(
    image: 'assets/images/c1.jpg',
    type: 'Hot Coffees',
    drinkName: 'Cappuccino',
    description: 'with milk',
    price: '5.20',
    rate: 4.5,
    ingredients: [
      '2 tablespoons finely ground dark roast coffee',
      '4 ounces water',
    ],
  ),
  Drink(
    image: 'assets/images/e2.jpg',
    type: 'Hot Coffees',
    drinkName: 'Espresso',
    description: 'revealing a thick, persistent crema',
    price: '6.50',
    rate: 4.5,
    ingredients: [
      '1/2 cup ground coffee (French or other dark roast)',
      '1-1/2 cups cold water',
      'Lemon twists, optional',
    ],
  ),
  Drink(
    image: 'assets/images/fw1.jpg',
    type: 'Hot Coffees',
    drinkName: 'Flat White',
    description: 'with microfoam',
    price: '10.25',
    rate: 4.5,
    ingredients: [
      '3 ounces espresso 2 shots.',
      '1 cup milk steamed.',
      'sugar to taste (optional)',
    ],
  ),
  Drink(
    image: 'assets/images/cm1.jpg',
    type: 'Hot Coffees',
    drinkName: 'Caffè Mocha',
    description: 'with sweetened whipped cream',
    price: '13.20',
    rate: 4.5,
    ingredients: [
      'Milk',
      'Chocolate syrup or sauce',
      'Espresso or strongly brewed coffee',
      'Heavy whipping cream',
      'Sugar',
      'Vanilla Extract',
    ],
  ),
];

List<Drink> icedDrinks = [
  Drink(
    image: 'assets/images/ic1.jpg',
    type: 'Cold Coffees',
    drinkName: 'Iced Coffee',
    description: 'with Milk',
    price: '7.25',
    rate: 4.5,
    ingredients: [
      '3 tablespoons warm water',
      '2 teaspoons instant coffee granules',
      '1 teaspoon sugar',
      '1 cup ice, or as needed',
      '6 fluid ounces cold milk',
    ],
  ),
  Drink(
    image: 'assets/images/is1.jpg',
    type: 'Cold Coffees',
    drinkName: 'Iced Espresso',
    description: 'extra creamy',
    price: '12.40',
    rate: 4.5,
    ingredients: [
      '1/2 cup ground espresso coffee beans',
      '2 cups boiling water',
      'white sugar, to taste',
      '2 litres vanilla ice-cream',
    ],
  ),
  Drink(
    image: 'assets/images/if1.jpg',
    type: 'Cold Coffees',
    drinkName: 'Iced Flat White',
    description: 'not-too-creamy',
    price: '5.20',
    rate: 4.5,
    ingredients: [
      '250 ml full-fat milk.',
      '1 espresso (45 ml)',
      '6 ice cubes.',
      '1 tbsp sugar.',
    ],
  ),
  Drink(
    image: 'assets/images/il1.jpg',
    type: 'Cold Coffees',
    drinkName: 'Iced Caffè Latte',
    description: 'with milk and served over ice',
    price: '6.50',
    rate: 4.5,
    ingredients: [
      '1/2 cup instant coffee granules',
      '1/2 cup boiling water',
      '4 cups chocolate milk',
      '2 cups cold water',
      '1 can (14 ounces) sweetened condensed milk',
      'Ice cubes',
    ],
  ),
  Drink(
    image: 'assets/images/il2.jpg',
    type: 'Cold Coffees',
    drinkName: 'Iced Cinnamon Dolce Latte',
    description: 'steamed milk and cinnamon dolce syrup',
    price: '10.25',
    rate: 4.5,
    ingredients: [
      '2 -3 tablespoons cinnamon dolce syrup.',
      '1 cup of cooled coffee or cold brew.',
      '1 cup of milk.',
      'whipped cream, for topping, optional.',
      'cinnamon, for topping, optional.'
    ],
  ),
  Drink(
    image: 'assets/images/im2.jpg',
    type: 'Cold Coffees',
    drinkName: 'Iced Caffè Mocha',
    description: 'with bittersweet mocha sauce, milk and ice',
    price: '13.20',
    rate: 4.5,
    ingredients: [
      '1 ½ cups cold coffee',
      '2 cups milk',
      '¼ cup chocolate syrup',
      '¼ cup white sugar',
    ],
  ),
  Drink(
    image: 'assets/images/wcm1.jpg',
    type: 'Cold Coffees',
    drinkName: 'Iced White Chocolate Mocha',
    description: 'with milk and ice',
    price: '13.20',
    rate: 4.5,
    ingredients: [
      'White Chocolate Sauce',
      'Espresso',
      'Milk',
      'Ice cubes',
      'Whipped Cream',
    ],
  ),
];

List<Drink> hotTeas = [
  Drink(
    image: 'assets/images/ct2.jpg',
    type: 'Hot Teas',
    drinkName: 'Chai Tea',
    description: 'with sugar, and spices',
    price: '7.25',
    rate: 4.5,
    ingredients: [
      '1/2 whole star anise',
      '10 to 12 whole cloves',
      '6 to 7 whole allspice',
      '1 heaping teaspoon (or 2 short sticks) cinnamon bark',
      '6 to 7 whole white peppercorns',
      '1 cardamon pod, opened to the seeds',
      '1 cup water',
      '4 cups whole milk',
      '2 heaping tablespoons high-quality, full-bodied broad-leaf black tea (Ceylon or English Breakfast)',
      'Sugar, to taste',
    ],
  ),
  Drink(
    image: 'assets/images/ctl.jpg',
    type: 'Hot Teas',
    drinkName: 'Chai Tea Latte',
    description: 'sweet and spicy',
    price: '12.40',
    rate: 4.5,
    ingredients: [
      '2 chai tea bags',
      '1/2 cup water',
      '1 1/2 cup milk',
      '2 tablespoons honey',
      'Cinnamon and nutmeg (for garnish)',
    ],
  ),
  Drink(
    image: 'assets/images/gt1.jpg',
    type: 'Hot Teas',
    drinkName: 'Earl Grey Tea',
    description: 'with bergamot',
    price: '6.50',
    rate: 4.5,
    ingredients: [
      'Black tea.',
      'Orange peel.',
      'Lemon peel.',
      'Natural citrus flavours with other natural flavours.',
    ],
  ),
  Drink(
    image: 'assets/images/ht1.jpg',
    type: 'Hot Teas',
    drinkName: 'Honey Citrus Mint Tea',
    description: 'green mint tea, lemon, and honey',
    price: '10.25',
    rate: 4.5,
    ingredients: [
      '1 cup Water.',
      '1 cup Organic lemonade or 3 tbsp fresh squeezed lemon juice.',
      '1 Teavana Jade Citrus Mint tea sachet or green mint tea bag.',
      '1 Teavana Peach Tranquility tea sachet or peach tea bag.',
      '1-2 drops of Peppermint extract (about 1/8 tsp)',
      '1 tbsp Honey or to taste.',
      '½ Lemon sliced.',
      '1 Sprig of fresh mint leaves.',
    ],
  ),
  Drink(
    image: 'assets/images/mt1.jpg',
    type: 'Hot Teas',
    drinkName: 'Matcha Tea Latte',
    description: 'served with steamed milk',
    price: '13.20',
    rate: 4.5,
    ingredients: [
      'tsp matcha green tea powder.',
      'tsp sugar.',
      'tbsp warm water.',
    ],
  ),
];

List<Map> cart = [];
List<Map> favourites = [];
