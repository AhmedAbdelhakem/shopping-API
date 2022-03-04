import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/free_e_commerce_app/ecommerce_app_cubit.dart';
import 'package:shopping/free_e_commerce_app/ecommerce_app_state.dart';
import 'package:shopping/models/ecommerce_home_response.dart';

class EcommerceShopHome extends StatelessWidget {
  late EcommerceAppCubit cubit;

  // late List<Banners> _banners ;
  // late List<Products> _products ;
  late String _ad;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceAppCubit, EcommerceAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        cubit = EcommerceAppCubit.get(context);
        return Scaffold(
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(seconds: 1),
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        height: MediaQuery.of(context).size.height * 0.25,
                        autoPlay: true,
                        reverse: false,
                        aspectRatio: double.infinity,
                      ),
                      items:getNetworkImage(),
                    ),
                  ),
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              child: Image.asset(
                                'images/sallaelectronics.png',
                                width: 100,
                                height: 80,
                              ),
                            ),
                            Text(
                              "Electronics",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                backgroundColor: Colors.grey[800],
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              child: Image.asset(
                                'images/sallaprevent.png',
                                width: 100,
                                height: 80,
                              ),
                            ),
                            Text(
                              "Prevent",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                backgroundColor: Colors.grey[800],
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              child: Image.asset(
                                'images/sallasports.png',
                                width: 100,
                                height: 80,
                              ),
                            ),
                            Text(
                              "Sports",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                backgroundColor: Colors.grey[800],
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              child: Image.asset(
                                'images/sallalightning.png',
                                width: 100,
                                height: 80,
                              ),
                            ),
                            Text(
                              "Lightning",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                backgroundColor: Colors.grey[800],
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "New Products",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    height: 300,
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) =>
                          ProductItem(cubit.products[index]),
                      itemCount: cubit.products.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> getNetworkImage() {
    List<Widget> images = [];
    if (cubit.banners.isEmpty) return images;
    cubit.banners.forEach((element) {images.add(Image(image: NetworkImage(element.image!)));},);
    return images;
  }
}

Widget ProductItem(Products products) {
  return Container(
    color: Colors.black,
    padding: EdgeInsets.all(1),
    child: Container(
      color: Colors.white,
      child: ListTile(
        title: Image(
          image: NetworkImage(
            products.image!,
          ),
          height: 100,
          width: 100,
        ),
        subtitle: Text(
          products.price.toString(),
          textAlign: TextAlign.center,
        ),
        onTap: () {},
      ),
    ),
  );
}
