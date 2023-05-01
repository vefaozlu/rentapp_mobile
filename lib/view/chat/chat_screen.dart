import "package:flutter/cupertino.dart";
import 'package:flutter/material.dart';
import "package:rent_app/constants.dart" as constants;
import 'package:rent_app/helper/color_package.dart';

class TextMessage {
  const TextMessage(this.text, this.isSent);

  final String text;
  final bool isSent;
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<TextMessage> texts = [
    TextMessage("Hello, how are you?", true),
    TextMessage("Fine, how are you?", false),
    TextMessage("Doing good.", true),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPackage.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorPackage.secondaryTextColor,
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios,
                        color: ColorPackage.primaryTextColor),
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(constants.IMAGE_URL),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    "John Doe",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: ColorPackage.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: texts.length,
                  itemBuilder: (context, index) {
                    if (texts[index].isSent) {
                      return SentTile(text: texts[index].text);
                    }
                    return RecievedTile(text: texts[index].text);
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: size.width * .8,
                  child: TextField(
                    controller: _controller,
                    cursorColor: ColorPackage.secondaryColor,
                    style: TextStyle(
                      color: ColorPackage.primaryTextColor,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPackage.primaryTextColor.withOpacity(.2),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorPackage.primaryTextColor.withOpacity(.5),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: ColorPackage.secondaryColor),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      setState(
                          () => texts.add(TextMessage(_controller.text, true)));
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SentTile extends StatelessWidget {
  const SentTile({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: size.width * .75,
                minWidth: size.width * .25,
                minHeight: 50,
              ),
              decoration: BoxDecoration(
                color: ColorPackage.secondaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecievedTile extends StatelessWidget {
  const RecievedTile({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: CupertinoColors.white.withOpacity(.85),
                borderRadius: BorderRadius.circular(15),
              ),
              constraints: BoxConstraints(
                maxWidth: size.width * .75,
                minWidth: size.width * .25,
                minHeight: 50,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
