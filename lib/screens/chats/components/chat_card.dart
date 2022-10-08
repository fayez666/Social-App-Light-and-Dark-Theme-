import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';

import '../../../shared/constants.dart';
import '../../../models/Chat.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.model,
    required this.press,
  }) : super(key: key);
  final UserModel model ;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.7),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(model.image!),
                ),
                if (true)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color:
                              Theme.of(context).scaffoldBackgroundColor)),
                    ),
                  )
              ],
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Opacity(
                        opacity: 0.64,
                        child: Text(
                          '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                )),
            const Opacity(opacity: 0.64, child: Text('3m ago'))
          ],
        ),
      ),
    );
  }
}
