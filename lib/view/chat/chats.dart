import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

import "message_tile.dart";

class Chats extends StatelessWidget {
  const Chats({super.key});
  final String imgLink =
      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const TitleBar(
              title: "Messages",
              backButton: false,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  MessageTile(src: imgLink),
                  MessageTile(src: imgLink),
                  MessageTile(src: imgLink),
                  MessageTile(src: imgLink),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
