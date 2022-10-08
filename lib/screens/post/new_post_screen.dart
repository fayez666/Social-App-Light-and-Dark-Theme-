import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import '../../shared/constants.dart';
import '../../shared/styles/icon_broken.dart';
import '../../shared/styles/size_config.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({Key? key}) : super(key: key);

  static String routeName = '/post';
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconBroken.Arrow___Left_2),
            ),
            title: const Text("Create Post"),
            actions: [
              TextButton(
                  onPressed: () {
                    var now = DateTime.now();
                    if (SocialCubit.get(context).postImage == null) {
                      SocialCubit.get(context).createPost(
                          dateTime: now.toString(), text: textController.text, context: context);
                    } else {
                      SocialCubit.get(context).uploadPostImage(
                          dateTime: now.toString(), text: textController.text, context: context);
                    }
                  },
                  child: Text(
                    "Post",
                    style: Theme.of(context).textTheme.bodyText1,
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialCreatePostLoadingState)
                  const LinearProgressIndicator(),
                if (state is SocialCreatePostLoadingState)
                  const SizedBox(
                    height: 10,
                  ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                        "https://img.freepik.com/free-photo/surprised-young-pretty-girl-points-up-isolated-blue-wall-with-copy-space_141793-78592.jpg?w=900&t=st=1664412431~exp=1664413031~hmac=8432a3a19bc6100f15f458914ff141abfd44434922eb63f0cb9a3e62177913dd",
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(20),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              "Abdallah Fayez",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.4),
                            ),
                          ],
                        ),
                        const Text(
                          "public",
                          style: TextStyle(fontSize: 12, height: 1.4),
                        )
                      ],
                    )),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                        hintText: "what is on your mind ... ",
                        border: InputBorder.none),
                  ),
                ),
                if(SocialCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            image: DecorationImage(
                                image:
                                    FileImage(SocialCubit.get(context).postImage!,),
                                )),
                      ),
                      IconButton(
                          onPressed: () {
                            SocialCubit.get(context).removePostImage();
                          },
                          icon: const CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: Icon(
                              Icons.close,
                              color: kPrimaryColor,
                            ),
                          ))
                    ],
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            SocialCubit.get(context).getPostImage();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(IconBroken.Image),
                              Text("  Photo/video")
                            ],
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(IconBroken.User),
                              Text("  Tag people")
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
