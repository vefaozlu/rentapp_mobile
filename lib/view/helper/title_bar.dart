import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rent_app/helper/color_package.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title, this.backButton = true});
  final String title;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      backgroundColor: ColorPackage.primaryColor,
      automaticallyImplyLeading: false,
      stretch: false,
      border: Border(
        bottom: BorderSide(
          color: ColorPackage.primaryTextColor,
          width: .5,
        ),
      ),
      leading: !backButton
          ? null
          : IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 28,
                color: ColorPackage.primaryTextColor,
              ),
            ),
      largeTitle: Text(
        title,
        style: TextStyle(color: ColorPackage.primaryTextColor),
      ),
    );
  }
}
