import "package:flutter/material.dart";
import "package:rent_app/constants.dart" as constants;
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

import "message_tile.dart";

class Chats extends StatelessWidget {
  const Chats({super.key});

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
                children: const [
                  MessageTile(src: constants.IMAGE_URL),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
