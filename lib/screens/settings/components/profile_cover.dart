import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

import '../../../shared/cubit/cubit.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({
    Key? key,
    required this.model,
    required this.coverImage,
  }) : super(key: key);
  final UserModel model;
  final File? coverImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          // use this package to check the image
          // CachedNetworkImage(
          //   imageUrl: "${model.cover}",
          //   placeholder: (context, url) => const CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          // ),
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                image: DecorationImage(
                    image: coverImage == null
                        ? NetworkImage("${model.cover}")
                        : FileImage(coverImage!) as ImageProvider,
                    fit: BoxFit.cover)),
          ),
          IconButton(
              onPressed: () {
                SocialCubit.get(context).getCoverImage();
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
      ),
    );
  }
}
