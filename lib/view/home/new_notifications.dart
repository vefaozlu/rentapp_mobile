import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

class NewNotifications extends StatelessWidget {
  const NewNotifications({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: size.width,
            child: Row(
              children: [
                Text(
                  "Notifications",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: ColorPackage.primaryTextColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  splashRadius: 20,
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: ColorPackage.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          TileOutlined(
            title: "Balance updated",
            subtitle: "New periods rent",
            leading: Icon(Icons.info, color: ColorPackage.primaryTextColor),
            trailing: "01/01/2023",
          ),
          TileOutlined(
            title: "Balance updated",
            subtitle: "Deposit balanced",
            leading: Icon(Icons.info, color: ColorPackage.primaryTextColor),
            trailing: "01/01/2023",
          )
        ],
      ),
    );
  }
}
