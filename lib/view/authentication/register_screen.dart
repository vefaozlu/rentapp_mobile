import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:rent_app/controller/auth/auth_bloc.dart";
import "package:rent_app/controller/register_form/register_form_cubit.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/service/auth_service.dart";
import "package:rent_app/view/app.dart";
import "package:rent_app/view/helper/helper.dart";

class RegisterProvider extends StatelessWidget {
  const RegisterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterFormCubit>(
          create: (context) => RegisterFormCubit(),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            authService: AuthService(),
          ),
        ),
      ],
      child: const RegisterScreen(),
    );
  }
}

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
    final state = context.watch<RegisterFormCubit>().state;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Content(),
            ),
          );
        }
        if (state.status == AuthStatus.initial) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: Scaffold(
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
                              value: state.name,
                              width: size.width * .4,
                              validator: true,
                              onChanged: (value) => context
                                  .read<RegisterFormCubit>()
                                  .onValueChanged(name: value),
                            ),
                            InputField(
                              label: "Surname",
                              value: state.surname,
                              width: size.width * .4,
                              validator: true,
                              onChanged: (value) => context
                                  .read<RegisterFormCubit>()
                                  .onValueChanged(surname: value),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: InputField(
                          label: "Username",
                          value: state.username,
                          width: size.width * .9,
                          validator: true,
                          onChanged: (value) => context
                              .read<RegisterFormCubit>()
                              .onValueChanged(username: value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: InputField(
                          label: "Email",
                          value: state.email,
                          width: size.width * .9,
                          validator: true,
                          onChanged: (value) => context
                              .read<RegisterFormCubit>()
                              .onValueChanged(email: value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: InputField(
                          label: "Phone Number",
                          value: state.phoneNumber.toString(),
                          width: size.width * .9,
                          validator: true,
                          onChanged: (value) => context
                              .read<RegisterFormCubit>()
                              .onValueChanged(phoneNumber: value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: InputField(
                          label: "Address",
                          value: state.address,
                          width: size.width * .9,
                          validator: true,
                          onChanged: (value) => context
                              .read<RegisterFormCubit>()
                              .onValueChanged(address: value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InputField(
                              label: "City",
                              value: state.city,
                              width: size.width * .4,
                              validator: true,
                              onChanged: (value) => context
                                  .read<RegisterFormCubit>()
                                  .onValueChanged(city: value),
                            ),
                            InputField(
                              label: "Zip Code",
                              value: state.zipCode.toString(),
                              width: size.width * .4,
                              validator: true,
                              onChanged: (value) => context
                                  .read<RegisterFormCubit>()
                                  .onValueChanged(zipCode: value),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: InputField(
                          label: "Password",
                          value: state.password,
                          isPassword: true,
                          validator: true,
                          onChanged: (value) => context
                              .read<RegisterFormCubit>()
                              .onValueChanged(password: value),
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
/*                           await context.read<AuthBloc>().register(
                                username: state.username,
                                password: state.password,
                                email: state.email,
                                phoneNumber: state.phoneNumber,
                              ); */
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
