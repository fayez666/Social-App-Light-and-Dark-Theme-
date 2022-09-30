import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../models/ChatMessage.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(message.isSender! ? 1 : 0.1),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          message.text!,
          style: TextStyle(
            fontSize: 16,
              color: message.isSender!
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color),
        ));
  }
}
