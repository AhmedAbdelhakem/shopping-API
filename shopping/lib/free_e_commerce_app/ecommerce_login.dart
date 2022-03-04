import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/free_e_commerce_app/ecommerce_home.dart';
import 'package:shopping/free_e_commerce_app/ecommerce_register.dart';
import '../widget.dart';
import 'ecommerce_app_cubit.dart';
import 'ecommerce_app_state.dart';

class EcommerceLoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool myPasswordGone = true;

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
    if (value.length < 4) {
      return "Password must be at least 8 character";
    }

    return null;
  }

  late EcommerceAppCubit cubit;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EcommerceAppCubit, EcommerceAppStates>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EcommerceHomeScreen(),
                ));
          }
          if(state is LoginFailureState){
            final snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          cubit = EcommerceAppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Welcome",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      "Login now to browse our hot offers",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                    myTextField(
                      controller: emailController,
                      iconData: Icons.email,
                      label: "Email",
                      validator: (value) => myValidator(value),
                    ),
                    myTextField(
                      controller: passwordController,
                      iconData: Icons.lock,
                      isPassword: myPasswordGone,
                      label: "Password",
                      validator: (value) => myPasswordValidator(value),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()){

                            String email = emailController.text;
                            String password = passwordController.text;

                            cubit.postLogin(email,password);


                          }
                        },
                        color: Colors.black,
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do not have account ?"),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EcommerceRegisterScreen(),
                                  ));
                            },
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
