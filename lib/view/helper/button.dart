import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";

class ElevatedButtonOutlined extends StatelessWidget {
  const ElevatedButtonOutlined({
    super.key,
    required this.text,
    required this.onPressed,
    required this.size,
  });
  final String text;
  final VoidCallback onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: size.width * .7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPackage.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: ColorPackage.primaryTextColor),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class ElevatedButtonFilled extends StatelessWidget {
  const ElevatedButtonFilled({
    super.key,
    required this.text,
    required this.onPressed,
    required this.size,
  });
  final String text;
  final VoidCallback onPressed;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: size.width * .7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorPackage.secondaryColor,
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
