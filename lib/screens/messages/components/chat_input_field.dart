import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';

import '../../../shared/constants.dart';
import '../../../shared/styles/icon_broken.dart';

class ChatInputField extends StatelessWidget {
  ChatInputField({
    Key? key, required this.model,
  }) : super(key: key);
  final UserModel model;
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){
        return Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 2),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 32,
                    color: const Color(0xFF087949).withOpacity(0.08))
              ]),
          child: SafeArea(
            child: Row(
              children: [
                const Icon(
                  Icons.mic,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 0.75),
                      height: 50,
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sentiment_satisfied_alt_outlined,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                          const SizedBox(
                            width: kDefaultPadding / 4,
                          ),
                          Expanded(
                              child: TextFormField(
                                controller: textController,
                                decoration: const InputDecoration(
                                    hintText: "Type message", border: InputBorder.none),
                              )),
                          InkWell(
                            onTap: () {
                              SocialCubit.get(context).sendMessage(
                                  receiverId: model.uId!,
                                  dateTime: DateTime.now().toString(),
                                  text: textController.text);
                            },
                            child: Icon(
                              IconBroken.Send,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .color!
                                  .withOpacity(0.64),
                            ),
                          ),
                          const SizedBox(
                            width: kDefaultPadding / 4,
                          ),
                          Icon(
                            Icons.camera_alt_outlined,
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.64),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
