import 'package:flutter/material.dart';
import '../../shared/styles/icon_broken.dart';

class NewPostScreen extends StatelessWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  static String routeName ='/post';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
              IconBroken.Arrow___Left_2
          ),
        ),
        title: const Text(
            "Add Post"
        ),
      )
    );
  }
}
