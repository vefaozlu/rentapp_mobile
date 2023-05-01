import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_app/controller/authentication/authentication_cubit.dart';
import 'package:rent_app/helper/color_package.dart';
import 'package:rent_app/view/app.dart';
import 'package:rent_app/view/helper/helper.dart';

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InputField(
                            label: "Email or Username",
                            controller: _usernameController,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InputField(
                            label: "Password",
                            controller: _passwordController,
                            isPassword: true,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButtonFilled(
                            text: "Login",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthenticationCubit>().login(
                                      _usernameController.text,
                                      _passwordController.text,
                                    );
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButtonOutlined(
                            text: " Create Account",
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (coontext) => const RegisterScreen(),
                              ),
                            ),
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
