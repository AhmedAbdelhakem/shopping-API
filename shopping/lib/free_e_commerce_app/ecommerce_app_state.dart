abstract class EcommerceAppStates{}

class AppInitialState extends EcommerceAppStates{}

class AppImportState extends EcommerceAppStates {}

class AppImportSportsState extends EcommerceAppStates {}

class AppImportBusinessState extends EcommerceAppStates {}

class AppBottomNavigationBarState extends EcommerceAppStates {}

class AppChangeTasksState extends EcommerceAppStates {}

class LoginSuccessState extends EcommerceAppStates{}

class HomeDataSuccess extends EcommerceAppStates{}

class LoginFailureState extends EcommerceAppStates{
  String errorMessage;

  LoginFailureState(this.errorMessage);
}