import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import 'package:rent_app/view/helper/helper.dart';

class PropertyScreen extends StatelessWidget {
  const PropertyScreen({super.key});
  final String src =
      "https://images.unsplash.com/photo-1542361345-89e58247f2d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJ1aWxkaW5nfGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=900&q=60";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: size.height * .3,
            backgroundColor: ColorPackage.primaryColor,
            pinned: true,
            title: const Text("Mountain House"),
            titleTextStyle: TextStyle(
              fontSize: 30,
              color: ColorPackage.primaryTextColor,
              fontWeight: FontWeight.bold,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(src, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UnconstrainedBox(
                      child: ElevatedButtonFilled(
                        text: "Make A Request",
                        onPressed: () => null,
                        size: size,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UnconstrainedBox(
                      child: ElevatedButtonOutlined(
                        text: "Contact Landlord",
                        onPressed: () => null,
                        size: size,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: ColorPackage.primaryTextColor,
              thickness: .25,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      info("Adress", "3314 Mountain Rd."),
                      info("Number", "4-A"),
                      info("Rent Amount", "250\$"),
                      info("Deposit", "200\$"),
                      info("Deposit Paid", "Yes"),
                      info("COntact Duration", "1 Year"),
                    ],
                  ),
                  Column(
                    children: [
                      info("Renter Name", "John Doe"),
                      info("Landlord Name", "Julia Smith"),
                      info("Landlord Email", "juliasmith@example.com"),
                      info("Landlord Adress", "3312 Mountain Rd."),
                      info("Pay Period", "Monthly"),
                      info("Payment Method", "Bank Transfer"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget info(String title, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: ColorPackage.primaryTextColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
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
