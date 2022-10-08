import 'package:flutter/material.dart';
import 'package:social_app/models/message.dart';
import 'package:social_app/shared/cubit/cubit.dart';

import '../../../shared/constants.dart';
import '../../../models/ChatMessage.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key, required this.index, required this.model,
  }) : super(key: key);
  final int index;
  final MessageModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(SocialCubit.get(context).model?.uId == SocialCubit.get(context).messages[index].senderId ? 1 : 0.1),
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          model.text,
          style: TextStyle(
            fontSize: 16,
              color: SocialCubit.get(context).model?.uId == SocialCubit.get(context).messages[index].senderId
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color),
        ));
  }
}
