import 'package:flutter/material.dart';
import 'package:rent_app/helper/color_package.dart';
import 'package:rent_app/view/app.dart';
import 'package:rent_app/view/helper/helper.dart';

import 'input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 65,
            left: 20,
            child: Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ColorPackage.primaryTextColor,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Center(
              child: SizedBox(
                height: size.height * .5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InputField(label: "Email or Username"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                              InputField(label: "Password", isPassword: true),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButtonFilled(
                            text: "Login",
                            size: size,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Content(),
                                    ));
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButtonOutlined(
                            text: " Create Account",
                            size: size,
                            onPressed: () => null,
                          ),
                        ),
                        TextButton(
                          onPressed: () => null,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 15,
                              color: ColorPackage.primaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
