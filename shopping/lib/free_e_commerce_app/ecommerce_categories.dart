import 'package:flutter/material.dart';

class EcommerceCategoriesScreen extends StatelessWidget {
  const EcommerceCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Image.asset(
                    'images/sallaelectronics.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Electronics",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 30,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Image.asset(
                    'images/sallaprevent.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Prevent",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 30,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Image.asset(
                    'images/sallasports.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Sports",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 30,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Image.asset(
                    'images/sallalightning.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Lightning",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
