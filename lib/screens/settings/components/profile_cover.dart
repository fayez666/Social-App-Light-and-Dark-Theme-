import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';

class ProfileCover extends StatelessWidget {
  const ProfileCover({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topCenter,
      child: Container(
        height: 140,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            image: DecorationImage(
                image: AssetImage(
                  "${model.cover}",
                ),
                fit: BoxFit.cover)),
      ),
    );
  }
}
