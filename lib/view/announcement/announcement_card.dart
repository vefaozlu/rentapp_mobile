import 'package:flutter/material.dart';
import 'package:rent_app/helper/color_package.dart';

class AnnouncementCard extends StatelessWidget {
  const AnnouncementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: ColorPackage.primaryColor,
          border: Border.all(color: ColorPackage.secondaryColor),
        ),
        child: Column(
          children: [
            Container(
              color: ColorPackage.secondaryColor,
              child: ListTile(
                tileColor: ColorPackage.secondaryColor,
                leading: const Icon(Icons.notifications),
                title: const Text(
                  "Smoking",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                subtitle: const Text(
                  "01/01/2023",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Hello there! Per the landlord no smoking allowed in front of the apartment. Thank you for cooperation.",
                  style: TextStyle(
                    color: ColorPackage.primaryTextColor.withOpacity(.8),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
