import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import "package:rent_app/view/helper/helper.dart";

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key, required this.onPressed});
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
                  "Recent Payments",
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
          const TileOutlined(
            leading: Icon(Icons.paid, color: Colors.greenAccent),
            title: "Payment",
            subtitle: "01/01/2023",
            trailing: "250\$",
          ),
          const TileOutlined(
            leading: Icon(Icons.paid, color: Colors.redAccent),
            title: "Rent",
            subtitle: "01/01/2023",
            trailing: "250\$",
          ),
          const TileOutlined(
            leading: Icon(Icons.paid, color: Colors.greenAccent),
            title: "Payment",
            subtitle: "01/01/2023",
            trailing: "250\$",
          ),
        ],
      ),
    );
  }
}
