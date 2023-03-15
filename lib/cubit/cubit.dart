import 'package:bloc/bloc.dart';
import 'package:coffee_shop/cubit/states.dart';
import 'package:coffee_shop/modules/screens/favourite_screen.dart';
import 'package:coffee_shop/modules/screens/home_screen.dart';
import 'package:coffee_shop/modules/screens/myProfile.dart';
import 'package:coffee_shop/shared/network/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
    BottomNavigationBarItem(label: 'My Profile', icon: Icon(Icons.person)),
    BottomNavigationBarItem(label: 'Favourite', icon: Icon(Icons.favorite)),
  ];
  List<Widget> screens = [
    HomeScreen(),
    const MyProfile(),
    const FavouriteScreen(),
  ];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  // handle categories

  int categoryIndex = 0;

  void changeCategoryIndex(int index) {
    categoryIndex = index;
    emit(AppCategoryState());
  }

  List<Map> searchDrinks = [];
  int categoryNumber = 0;
  int drinkNumber = 0;
  int counter = 0;

  void getSearch(String value) {
    for (int i = 0; i < drinks.length; i++) {
      for (int j = 0; j < drinks[i].length; j++) {
        if (drinks[i][j].drinkName.contains(value)) {
          categoryNumber = i;
          drinkNumber = j;
          searchDrinks.add({
            'image': drinks[i][j].image,
            'type': drinks[i][j].type,
            'drinkName': drinks[i][j].drinkName,
            'description': drinks[i][j].description,
            'price': drinks[i][j].price,
            'rate': drinks[i][j].rate,
          });
          emit(AppGetSearchSuccessState());
          print(categoryNumber);
          print(drinkNumber);
          print(searchDrinks[counter]['drinkName']);
          print(drinks[i][j].drinkName);
          counter++;
        }
        if (counter == 6) {
          break;
        }
      }
      if (counter == 6) {
        break;
      }
    }
    // emit(AppGetSearchLoadingState());
    // DioHelper.getData(url: 'v2/everything', query: {
    //   'q': value,
    //   'apiKey': '245e6c773f384b66bfa1aa40dc4fe949'
    // }).then((value) {
    //   search = value.data['articles'];
    //   emit(AppGetSearchSuccessState());
    // }).catchError((e) {
    //   emit(AppGetSearchErrorState(e.toString()));
    // });
  }

  List<Widget> sizes = <Widget>[
    const Text('S'),
    const Text('M'),
    const Text('L')
  ];
  final List<bool> selectedSize = <bool>[true, false, false];

  void toggleButton(int x) {
    for (int i = 0; i < selectedSize.length; i++) {
      selectedSize[i] = i == x;
      emit(ToggleButtonsState());
    }
  }

  double productCounter = 0;

  void incrementCounter() {
    productCounter++;
    emit(IncrementCounterState());
  }

  void decrementCounter() {
    productCounter--;
    emit(DecrementCounterState());
  }

  bool isFavourite=false;
  void favouriteMode(){
    isFavourite=!isFavourite;
    emit(ChangeFavouriteMode());
  }
}
