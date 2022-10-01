import 'package:flutter/material.dart';
import 'package:social_app/models/user.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key, required this.model,
  }) : super(key: key);
  final UserModel model;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 64,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: CircleAvatar(
        radius: 60.0,
        backgroundImage: NetworkImage(
          "${model.image}",
        ),
      ),
    );
  }
}
