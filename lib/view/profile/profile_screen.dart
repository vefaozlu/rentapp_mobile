import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:rent_app/constants.dart" as constants;
import "package:rent_app/controller/auth/auth_bloc.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: size.height * .25 + 70,
              width: size.width,
              child: Stack(
                children: [
                  Container(
                    height: size.height * .25,
                    width: size.width,
                    color: ColorPackage.secondaryColor,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: ColorPackage.primaryTextColor,
                      backgroundImage: const NetworkImage(constants.IMAGE_URL),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.all(12),
          ),
          SliverToBoxAdapter(
            child: Text(
              "John Doe",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                color: ColorPackage.primaryTextColor,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorPackage.secondaryTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "johndoe@example.com",
                      style: TextStyle(
                        fontSize: 21,
                        color: ColorPackage.primaryTextColor,
                      ),
                    ),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorPackage.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "johndoe@example.com",
                    style: TextStyle(
                      fontSize: 21,
                      color: ColorPackage.primaryTextColor,
                    ),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorPackage.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "johndoe@example.com",
                    style: TextStyle(
                      fontSize: 21,
                      color: ColorPackage.primaryTextColor,
                    ),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorPackage.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "johndoe@example.com",
                    style: TextStyle(
                      fontSize: 21,
                      color: ColorPackage.primaryTextColor,
                    ),
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorPackage.secondaryTextColor,
                    ),
                  ),
                  Text(
                    "johndoe@example.com",
                    style: TextStyle(
                      fontSize: 21,
                      color: ColorPackage.primaryTextColor,
                    ),
                  ),
                  ElevatedButtonOutlined(
                    text: "Log out",
                    onPressed: () => context.read<AuthBloc>().add(Logout()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
