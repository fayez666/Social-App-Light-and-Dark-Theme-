import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/states.dart';

import '../../../components/filled_outline_button.dart';
import '../../../models/user.dart';
import '../../../shared/constants.dart';
import '../../../models/Chat.dart';
import '../../../shared/cubit/cubit.dart';
import '../../messages/messages_screen.dart';
import 'chat_card.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
                color: kPrimaryColor,
                child: Row(
                  children: [
                    FillOutlineButton(press: () {}, text: "Recent Message"),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    FillOutlineButton(
                      press: () {},
                      text: "Active",
                      isFilled: false,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: SocialCubit.get(context).users.length,
                itemBuilder: (context, index) => ChatCard(
                  model: SocialCubit.get(context).users[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MessagesScreen(model: SocialCubit.get(context).users[index],))),
                ),
              ))
            ],
          );
        });
  }
}
