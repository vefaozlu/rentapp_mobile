import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:rent_app/controller/route/route_cubit.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";
import 'package:rent_app/view/property/property_screen.dart';

class AppBarBackground extends StatelessWidget {
  const AppBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPaid = false;
    BuildContext mainContext = context.watch<RouteCubit>().state.context;
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 75.0),
            child: !isPaid ? balanceText() : TickCircle(),
          ),
        ),
        Positioned(
          bottom: 15,
          right: 15,
          child: InkWell(
            onTap: () => Navigator.push(
              mainContext,
              MaterialPageRoute(
                builder: (mainContext) => const PropertyScreen(),
              ),
            ),
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: ColorPackage.primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(
                  Icons.apartment,
                  color: ColorPackage.secondaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget balanceText() {
    return Text(
      "Current Balance\n250\$",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: ColorPackage.primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
    );
  }
}
