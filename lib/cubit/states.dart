abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavState extends AppStates {}

class AppCategoryState extends AppStates {}

class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchSuccessState extends AppStates {}

class AppGetSearchErrorState extends AppStates {
  final String error;

  AppGetSearchErrorState(this.error);
}

class ToggleButtonsState extends AppStates {}

class AddCartState extends AppStates {}

class GetCartState extends AppStates {}

class RemoveProductState extends AppStates {}

class IncrementCounterState extends AppStates {}

class DecrementCounterState extends AppStates {}
class ChangeFavouriteMode extends AppStates {}
