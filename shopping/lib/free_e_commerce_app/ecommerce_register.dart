import 'package:flutter/material.dart';

import '../widget.dart';

class EcommerceRegisterScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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

  myPasswordValidator(value) {
    if (value!.isEmpty) {
      return "Password required";
    }
    if (value.length < 8) {
      return "Password must be at least 8 character";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              "Register now to browse our hot offers",
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            myTextField(
              controller: emailController,
              iconData: Icons.person,
              label: "User name",
              validator: (value) => myValidator(value),
            ), myTextField(
              controller: emailController,
              iconData: Icons.email,
              label: "Email",
              validator: (value) => myValidator(value),
            ), myTextField(
              controller: emailController,
              iconData: Icons.lock,
              label: "Password",
              validator: (value) => myValidator(value),
            ), myTextField(
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
                  "Register",
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
