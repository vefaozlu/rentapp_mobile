import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  String url =
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
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
                      backgroundImage: NetworkImage(url),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
