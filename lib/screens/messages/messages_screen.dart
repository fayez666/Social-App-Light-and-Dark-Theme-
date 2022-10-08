import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/screens/messages/components/body.dart';
import 'package:social_app/shared/cubit/cubit.dart';

import '../../shared/constants.dart';
import '../../shared/cubit/states.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key, required this.model}) : super(key: key);
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        SocialCubit.get(context).getMessages(receiverId: model.uId!);
        return BlocConsumer<SocialCubit, SocialStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ConditionalBuilder(
                condition: SocialCubit.get(context).messages.isNotEmpty,
                builder: (context) {
                  return Scaffold(
                    appBar: buildAppBar(context, model),
                    body: Body(
                      model: model,
                    ),
                  );
                },
                fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ));
          },
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context, UserModel model) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          const SizedBox(
            width: kDefaultPadding,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(model.image!),
          ),
          const SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${model.name}",
                style: const TextStyle(fontSize: 16),
              ),
              const Text("Active 3m ago", style: TextStyle(fontSize: 12))
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
