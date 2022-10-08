import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';

import '../../../shared/constants.dart';
import '../../../models/ChatMessage.dart';
import 'chat_input_field.dart';
import 'message.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.model}) : super(key: key);
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) => Message(
                    message: demeChatMessages[index],
                  )),
        )),
        ChatInputField(model:  model,)
      ],
    );
  }
}

