import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/free_e_commerce_app/ecommerce_Setting.dart';
import 'package:shopping/free_e_commerce_app/ecommerce_favorite.dart';
import 'package:shopping/free_e_commerce_app/shop_home.dart';
import 'package:shopping/models/ecommerce_home_response.dart';
import 'package:shopping/models/ecommerce_login_response.dart';
import 'package:shopping/my_shared.dart';
import '../my_dio.dart';
import 'ecommerce_app_state.dart';
import 'ecommerce_categories.dart';

class EcommerceAppCubit extends Cubit<EcommerceAppStates> {
  EcommerceAppCubit(EcommerceAppStates initialState) : super(initialState);

  static EcommerceAppCubit get(context) => BlocProvider.of(context);

  int position = 0;

  var title = [
    'Home',
    'Categories',
    'Favorite',
    'Setting',
  ];

  List<Widget> screen = [
    EcommerceShopHome(),
    EcommerceCategoriesScreen(),
    EcommerceFavoriteScreen(),
    EcommerceSettingScreen(),
  ];

  void postLogin(
    String email,
    String password,
  ) {
    MyDio.postData(url: "login", body: {
      'email': '$email',
      'password': '$password',
    }).then((value) {
      EcommerceLoginResponse response =
          EcommerceLoginResponse.fromJson(value.data);

      if (response.status!) {
        print(response.data!.token);

        MyShared.putString(key: "token", value: response.data!.token.toString());
        emit(LoginSuccessState());
        getHomeData();

      } else {
        print(response.message);
        emit(LoginFailureState(response.message.toString()));
      }
    });
  }

  List<Banners> banners = [];
  List<Products> products = [];

  void getHomeData(){
    String token = MyShared.getString(key: "token") ??"";

    MyDio.getData(url: "home",token: token).then((value) {
      EcommerceHomeResponse response = EcommerceHomeResponse.fromJson(value.data);

      if(response.status!){
        banners = response.data!.banners!;
        products = response.data!.products!;
        print('HOME SCREEN');
        print(response.data!.banners!.length);
        print(response.data!.products!.length);
        emit(HomeDataSuccess());
      }else{
        print(response.message);
      }
    });
  }

  void onBottomNavigationChange(int value) {
    position = value;
    emit(AppBottomNavigationBarState());
  }
}
