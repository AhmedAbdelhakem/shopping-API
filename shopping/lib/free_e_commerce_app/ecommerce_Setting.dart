import 'package:flutter/material.dart';

import '../widget.dart';

class EcommerceSettingScreen extends StatelessWidget {
  myValidator(value) {
    if (value!.isEmpty) {
      return "Email required";
    }
    bool emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (emailValid) {
      return null;
    } else {
      return "Email not valid";
    }
  }
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      "https://picjumbo.com/wp-content/uploads/alone-with-his-thoughts-1080x720.jpg"),
                ),
              ],
            ),
            myTextField(
              controller: emailController,
              iconData: Icons.person,
              label: "User name",
              validator: (value) => myValidator(value),
            ),
            myTextField(
              controller: emailController,
              iconData: Icons.email,
              label: "Email",
              validator: (value) => myValidator(value),
            ),
            myTextField(
              controller: emailController,
              iconData: Icons.phone,
              label: "Phone",
              validator: (value) => myValidator(value),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {},
                color: Colors.black,
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {},
                color: Colors.black,
                child: Text(
                  "LOGOUT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
