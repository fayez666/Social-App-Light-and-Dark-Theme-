import 'package:flutter/material.dart';
import 'package:social_app/screens/messages/components/body.dart';

import '../../shared/constants.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const Icon(Icons.arrow_back_ios_new_outlined),
          const SizedBox(
            width: kDefaultPadding,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          const SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Kristin Weston",
                style: TextStyle(fontSize: 16),
              ),
              Text("Active 3m ago", style: TextStyle(fontSize: 12))
            ],
          )
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.local_phone)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
        const SizedBox(
          width: kDefaultPadding / 2,
        )
      ],
    );
  }
}
