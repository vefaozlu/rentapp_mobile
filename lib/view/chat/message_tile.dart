import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_app/controller/route/route_cubit.dart';
import 'package:rent_app/helper/color_package.dart';

import 'chat_screen.dart';

class MessageTile extends StatelessWidget {
  const MessageTile({super.key, required this.src});
  final String src;

  @override
  Widget build(BuildContext context) {
    BuildContext mainContext = context.watch<RouteCubit>().state.context;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        onTap: () => Navigator.push(
          mainContext,
          CupertinoPageRoute(builder: (mainContext) => const ChatScreen()),
        ),
        child: SizedBox(
          width: size.width * .90,
          height: 60,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(src),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:
                          BorderSide(color: ColorPackage.secondaryTextColor),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: ColorPackage.primaryTextColor,
                            ),
                          ),
                          Text(
                            "Hello, how are you?",
                            style: TextStyle(
                              fontSize: 16,
                              color: ColorPackage.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        "01/01/2023",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorPackage.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
