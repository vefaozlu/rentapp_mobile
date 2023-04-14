import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";

class TileOutlined extends StatelessWidget {
  const TileOutlined({
    super.key,
    required this.title,
    required this.subtitle,
    required this.leading,
    this.trailing = "",
  });
  final String title;
  final String subtitle;
  final Widget leading;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: ColorPackage.primaryTextColor.withOpacity(.2),
          ),
        ),
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorPackage.primaryTextColor),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: ColorPackage.primaryTextColor),
          ),
          trailing: trailing.isEmpty
              ? const SizedBox()
              : Text(
                  trailing,
                  style: TextStyle(color: ColorPackage.primaryTextColor),
                ),
        ),
      ),
    );
  }
}
