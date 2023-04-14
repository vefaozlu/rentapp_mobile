import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";

class PropertyInfo extends StatelessWidget {
  const PropertyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              propertyInfoText(),
              propertyInfoText(),
              propertyInfoText(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              propertyInfoText(),
              propertyInfoText(),
              propertyInfoText(),
            ],
          ),
        ],
      ),
    );
  }

  Widget propertyInfoText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Rent Amount",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: ColorPackage.primaryTextColor,
            ),
          ),
          Text(
            "250",
            style: TextStyle(
              fontSize: 16,
              color: ColorPackage.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
