import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/edit_profile/edit_profile_screen.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import '../../shared/styles/icon_broken.dart';
import 'components/number_items.dart';
import 'components/profile_cover.dart';
import 'components/profile_picture.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).model;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;
        print(userModel);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 190.0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    ProfileCover(
                      model: userModel!,
                      coverImage: coverImage,
                    ),
                    ProfilePicture(
                      profileImage: profileImage,
                      model: userModel,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${userModel.name}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${userModel.bio}",
                style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .color!
                        .withOpacity(0.8)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: const [
                    NumberItems(
                      number: 100,
                      text: "Posts",
                    ),
                    NumberItems(
                      number: 43,
                      text: "Photos",
                    ),
                    NumberItems(
                      number: 256,
                      text: "Followers",
                    ),
                    NumberItems(
                      number: 86,
                      text: "Followings",
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Edit profile"),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, EditProfileScreen.routeName);
                    },
                    child: const Icon(
                      IconBroken.Edit,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.more_horiz
                      )),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
