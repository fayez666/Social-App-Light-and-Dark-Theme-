import 'package:flutter/material.dart';
import 'package:social_app/models/message.dart';
import 'package:social_app/screens/messages/components/text_message.dart';
import 'package:social_app/shared/cubit/cubit.dart';

import '../../../shared/constants.dart';
import '../../../models/ChatMessage.dart';
import '../video_message.dart';
import 'audio_message.dart';

class Message extends StatelessWidget {
  const Message({
    Key? key, required this.index, required this.model,
  }) : super(key: key);

  final int index;
  final MessageModel model;

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            SocialCubit.get(context).model?.uId == SocialCubit.get(context).messages[index].senderId? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (SocialCubit.get(context).model?.uId == SocialCubit.get(context).messages[index].receiverId) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(SocialCubit.get(context).model!.image!),
            ),
            const SizedBox(
              width: kDefaultPadding / 2,
            )
          ],
          TextMessage(model: model, index: index,),
        ],
      ),
    );
  }
}

class MessageStatusDot extends StatelessWidget {
  const MessageStatusDot({Key? key, required this.status}) : super(key: key);
  final MessageStatus status;

  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.not_sent:
          return kErrorColor;
        case MessageStatus.not_view:
          return Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return kPrimaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: kDefaultPadding / 2),
      height: 12,
      width: 12,
      decoration:
          BoxDecoration(color: dotColor(status), shape: BoxShape.circle),
      child: Icon(
        status == MessageStatus.not_sent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
