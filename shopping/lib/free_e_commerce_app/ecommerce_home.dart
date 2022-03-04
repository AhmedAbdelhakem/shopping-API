import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/free_e_commerce_app/ecommerce_app_cubit.dart';
import 'ecommerce_app_state.dart';

class EcommerceHomeScreen extends StatelessWidget {
  List<String> imageList = [];
  late EcommerceAppCubit cubit;




  @override
  Widget build(BuildContext context) {
    cubit = EcommerceAppCubit.get(context);
    print('HOOMEE');

    return  BlocConsumer<EcommerceAppCubit, EcommerceAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Salla",
                style: TextStyle(color: Colors.black),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(.60),
              selectedFontSize: 14,
              unselectedFontSize: 14,
              onTap: (value) {
                cubit.onBottomNavigationChange(value);
              },
              items: [
                BottomNavigationBarItem(
                  label: cubit.title[0],
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: cubit.title[1],
                  icon: Icon(Icons.category),
                ),
                BottomNavigationBarItem(
                  label: cubit.title[2],
                  icon: Icon(Icons.favorite),
                ),
                BottomNavigationBarItem(
                  label: cubit.title[3],
                  icon: Icon(Icons.settings),
                ),
              ],
              currentIndex: cubit.position,
            ),
            body: cubit.screen[cubit.position],
          );
        },
    );
  }
}
