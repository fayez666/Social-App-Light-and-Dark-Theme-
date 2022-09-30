import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../../models/ChatMessage.dart';

class AudioMessage extends StatelessWidget {
  const AudioMessage({Key? key, required this.message}) : super(key: key);
  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding * 0.75,
        vertical: kDefaultPadding / 2.5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kPrimaryColor.withOpacity(message.isSender! ? 1 : 0.1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.play_arrow,
            color: message.isSender! ? Colors.white : kPrimaryColor,
          ),
          const SizedBox(
            width: kDefaultPadding / 4,
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 2,
                  color: message.isSender!
                      ? Colors.white
                      : kPrimaryColor.withOpacity(0.4),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color: message.isSender! ? Colors.white : kPrimaryColor,
                        shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: kDefaultPadding / 2,
          ),
          Text(
            "0.37",
            style: TextStyle(
                fontSize: 14, color: message.isSender! ? Colors.white : null),
          )
        ],
      ),
    );
  }
}
