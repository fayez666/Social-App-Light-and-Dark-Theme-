import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/chats/components/body.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';

import '../../shared/constants.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: const Body(
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: kPrimaryColor,
            child: const Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
