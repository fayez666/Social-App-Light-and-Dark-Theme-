import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/shared/cubit/cubit.dart';

import '../../../shared/constants.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.model,
    required this.profileImage,
  }) : super(key: key);
  final UserModel model;
  final File? profileImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          radius: 64,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child:
          CircleAvatar(
            radius: 60.0,
            backgroundImage: profileImage == null ? NetworkImage(
              "${model.image}",) : FileImage(
                profileImage!) as ImageProvider ,
          ),
        ),
        IconButton(
            onPressed: () {
              SocialCubit.get(context).getProfileImage();
            },
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(
                Icons.camera_alt_rounded,
                color: kPrimaryColor,
              ),
            ))
      ],
    );
  }
}
