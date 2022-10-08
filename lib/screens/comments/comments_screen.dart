import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';

import '../../shared/styles/icon_broken.dart';

// ignore: must_be_immutable
class CommentDetailsScreen extends StatelessWidget {
  // List<CommentModel> comments;
  final PostModel postModel;

  CommentDetailsScreen({required this.postModel});

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SocialCubit.get(context).getComments(postId: postModel.postId!);

    return Scaffold(
      appBar: AppBar(
        title: Text("Comments"),
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () => Get.back(),
        //   icon: Icon(Iconly_Broken.Arrow___Left_2),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageProfile(image: postModel.image!, radius: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${postModel.name!} ",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                      ),
                      Text(
                        postModel.text!,
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(thickness: 2),
            Expanded(
              child: BlocConsumer<SocialCubit, SocialStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return ConditionalBuilder(
                    condition: SocialCubit.get(context).comments.isNotEmpty,
                    builder: (context) => ListView.builder(
                      // shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: SocialCubit.get(context).comments.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageProfile(
                                  image: SocialCubit.get(context)
                                      .comments[index]
                                      .image!,
                                  radius: 20),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text:
                                                "${SocialCubit.get(context).comments[index].name!} ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                          ),
                                          TextSpan(
                                            text: SocialCubit.get(context)
                                                .comments[index]
                                                .comment!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 16,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      SocialCubit.get(context)
                                          .comments[index]
                                          .dateTime!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(),
                                    ),
                                  ],
                                ),
                              ),
                              // if (UserController.model!.uId == _homeController.comments[index].uId)
                              //   TextButton(
                              //     onPressed: () {
                              //       _homeController.deleteComment(
                              //         postId: postModel.postId!,
                              //         commentModel: _homeController.comments[index],
                              //       );
                              //     },
                              //     child:const Text("delete", style: TextStyle(color: Colors.red)),
                              //   ),
                            ],
                          ),
                        );
                      },
                    ),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
            )

            // Expanded(
            //   child: GetBuilder<HomeController>(
            //     builder: (_) => ListView.builder(
            //       // shrinkWrap: true,
            //       // physics: NeverScrollableScrollPhysics(),
            //       itemCount: _homeController.comments.length,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Container(
            //           padding: EdgeInsets.symmetric(vertical: 10),
            //           child: Container(
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.start,
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 ImageProfile(image: _homeController.comments[index].image!, radius: 20),
            //                 const  SizedBox(width: 10),
            //                 Expanded(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       Text.rich(
            //                         TextSpan(
            //                           children: [
            //                             TextSpan(
            //                               text: "${_homeController.comments[index].name!} ",
            //                               style: Theme.of(context).textTheme.headline3!.copyWith(
            //                                 fontWeight: FontWeight.w600,
            //                                 fontSize: 16,
            //                               ),
            //                             ),
            //                             TextSpan(
            //                               text: _homeController.comments[index].comment!,
            //                               style: Theme.of(context).textTheme.headline3!.copyWith(
            //                                 fontWeight: FontWeight.normal,
            //                                 fontSize: 16,
            //                               ),
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                       Text(
            //                         _homeController.comments[index].dateTime!,
            //                         style: Theme.of(context).textTheme.caption!.copyWith(),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //                 // if (UserController.model!.uId == _homeController.comments[index].uId)
            //                 //   TextButton(
            //                 //     onPressed: () {
            //                 //       _homeController.deleteComment(
            //                 //         postId: postModel.postId!,
            //                 //         commentModel: _homeController.comments[index],
            //                 //       );
            //                 //     },
            //                 //     child:const Text("delete", style: TextStyle(color: Colors.red)),
            //                 //   ),
            //               ],
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
            ,
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Write your comment here.....",
                          border: InputBorder.none,
                        ),
                        controller: _textController,
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await  SocialCubit.get(context).commentPost(
                          postModel: postModel,
                          commentText: _textController.text,
                        );
                        _textController.clear();
                      },
                      child: Icon(
                        (IconBroken.Send),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TODO : MOVE THIS CLASSES

class ImageProfile extends StatelessWidget {
  final String image;
  final double radius;

  const ImageProfile({required this.image, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(image),
    );
  }
}
