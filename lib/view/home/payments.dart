import "package:flutter/material.dart";
import "package:rent_app/helper/color_package.dart";
import 'package:rent_app/model/models/model.dart';
import "package:rent_app/view/helper/helper.dart";

class Payments extends StatelessWidget {
  const Payments({super.key});

  final List<Transaction> transactions = const [
    Transaction(isPayment: true, amount: "950\$", date: "12/12/2020"),
    Transaction(isPayment: false, amount: "250\$", date: "11/12/2020"),
    Transaction(isPayment: false, amount: "250\$", date: "11/11/2020"),
    Transaction(isPayment: false, amount: "450\$", date: "11/10/2020"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const TitleBar(
              title: "Payments",
              backButton: true,
            ),
            const SliverPadding(padding: EdgeInsets.all(8)),
            SliverToBoxAdapter(
              child: Column(
                children: List.generate(
                  transactions.length,
                  (index) => TileOutlined(
                    leading: Icon(
                      Icons.paid,
                      color: transactions[index].isPayment
                          ? Colors.greenAccent
                          : Colors.redAccent,
                    ),
                    title:
                        transactions[index].isPayment ? "Payment" : "Balance",
                    subtitle: transactions[index].date,
                    trailing: transactions[index].isPayment
                        ? "-${transactions[index].amount}"
                        : "+${transactions[index].amount}",
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
