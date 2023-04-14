import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

class Notification {
  const Notification({
    required this.title,
    required this.subtitle,
    required this.date,
    this.readed = false,
  });

  final String title;
  final String subtitle;
  final String date;
  final bool readed;
}

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  final List<Notification> notifications = const [
    Notification(
      title: "Balance updated",
      subtitle: "New periods rent",
      date: "01/01/2023",
    ),
    Notification(
      title: "Balance updated",
      subtitle: "Deposit balanced",
      date: "01/01/2023",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: CustomScrollView(
        slivers: [
          const TitleBar(title: "Notifications", backButton: true),
          const SliverPadding(padding: EdgeInsets.all(8)),
          SliverToBoxAdapter(
            child: Column(
              children: List.generate(
                notifications.length,
                (index) => TileOutlined(
                  leading: Icon(
                    Icons.info,
                    color: notifications[index].readed
                        ? ColorPackage.secondaryTextColor
                        : ColorPackage.primaryTextColor,
                  ),
                  title: notifications[index].title,
                  subtitle: notifications[index].subtitle,
                  trailing: notifications[index].date,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
