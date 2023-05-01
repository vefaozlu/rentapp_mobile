import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_app/controller/route/route_cubit.dart';
import 'package:rent_app/helper/color_package.dart';
import 'package:rent_app/view/helper/helper.dart';

import 'app_bar_background.dart';
import 'new_notifications.dart';
import 'notifications.dart';
import 'payment_screen.dart';
import 'payments.dart';
import 'property_info.dart';
import 'recent_transactions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BuildContext mainContext = context.watch<RouteCubit>().state.context;
    Size size = MediaQuery.of(context).size;
    bool isPaid = false;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: size.height * .3,
            backgroundColor: ColorPackage.secondaryColor,
            title: const Text("Mountain House"),
            titleTextStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            flexibleSpace: const FlexibleSpaceBar(
              background: AppBarBackground(),
            ),
          ),
          SliverToBoxAdapter(
            child: isPaid
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: UnconstrainedBox(
                      child: ElevatedButtonOutlined(
                        onPressed: () => Navigator.push(
                          mainContext,
                          MaterialPageRoute(
                            builder: (mainContext) => const PaymentScreen(),
                          ),
                        ),
                        text: "Pay Invoice",
                      ),
                    ),
                  ),
          ),
          SliverToBoxAdapter(
            child: NewNotifications(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Notifications(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: RecentTransactions(
              onPressed: () => Navigator.push(
                mainContext,
                MaterialPageRoute(
                  builder: (mainContext) => const Payments(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Divider(
              color: ColorPackage.primaryTextColor,
              thickness: .5,
            ),
          ),
          const SliverToBoxAdapter(
            child: PropertyInfo(),
          ),
        ],
      ),
    );
  }
}
