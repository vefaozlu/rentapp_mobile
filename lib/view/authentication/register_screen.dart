import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const TitleBar(
              title: "Register",
            ),
            SliverToBoxAdapter(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InputField(
                            label: "Name",
                            width: size.width * .4,
                            validator: true,
                          ),
                          InputField(
                            label: "Surname",
                            width: size.width * .4,
                            validator: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InputField(
                        label: "Email",
                        width: size.width * .9,
                        validator: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InputField(
                        label: "Phone Number",
                        width: size.width * .9,
                        validator: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InputField(
                        label: "Address",
                        width: size.width * .9,
                        validator: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InputField(
                            label: "City",
                            width: size.width * .4,
                            validator: true,
                          ),
                          InputField(
                            label: "Zip Code",
                            width: size.width * .4,
                            validator: true,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InputField(
                        label: "Password",
                        isPassword: true,
                        validator: true,
                        width: size.width * .9,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InputField(
                        label: "Confirm Password",
                        isPassword: true,
                        validator: true,
                        width: size.width * .9,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: InputField(
                        label: "Property ID",
                        width: size.width * .9,
                        validator: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverPadding(padding: EdgeInsets.all(20)),
            SliverToBoxAdapter(
              child: UnconstrainedBox(
                child: SizedBox(
                  width: size.width * .9,
                  child: ElevatedButtonFilled(
                    text: "Register",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Processing Data"),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
