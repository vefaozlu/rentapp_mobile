import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

import "announcement_card.dart";

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const TitleBar(
              title: "Announcements",
              backButton: false,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: const [
                  AnnouncementCard(),
                  AnnouncementCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
