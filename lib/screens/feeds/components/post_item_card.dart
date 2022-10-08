import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/screens/comments/comments_screen.dart';
import 'package:social_app/shared/cubit/cubit.dart';

import '../../../shared/constants.dart';
import '../../../shared/styles/icon_broken.dart';
import '../../../shared/styles/size_config.dart';
import 'hash_tag.dart';

class PostItemCard extends StatefulWidget {
  const PostItemCard({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  final PostModel model;
  final int index;

  @override
  State<PostItemCard> createState() => _PostItemCardState();
}

class _PostItemCardState extends State<PostItemCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(
                    "${widget.model.image}",
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
                      children: [
                        Text(
                          "${widget.model.name}",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              height: 1.4),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(8.0),
                        ),
                        const Icon(
                          Icons.check_circle,
                          color: kPrimaryColor,
                          size: 16,
                        )
                      ],
                    ),
                    Text(
                      "${widget.model.dateTime}",
                      style: const TextStyle(fontSize: 12, height: 1.4),
                    )
                  ],
                )),
                SizedBox(
                  width: getProportionateScreenWidth(15),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Text("${widget.model.text}"),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                top: 5,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(children: const [
                  HashTag(
                    text: 'software',
                  ),
                  HashTag(
                    text: 'video',
                  ),
                  HashTag(
                    text: 'photoshop',
                  ),
                  HashTag(
                    text: 'video',
                  ),
                ]),
              ),
            ),
            if (widget.model.postImage != '')
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      image: DecorationImage(
                          image: NetworkImage("${widget.model.postImage}"),
                          fit: BoxFit.cover)),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              IconBroken.Heart,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                              "${SocialCubit.get(context).posts[widget.index].likeCount ?? 0} likes")
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    CommentDetailsScreen(postModel: widget.model),
                              ));
                              print("Chat Icon");
                            },
                            child: const Icon(
                              IconBroken.Chat,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                           Text("${SocialCubit.get(context).posts[widget.index].commentCount ?? "0"}  comments")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundImage: NetworkImage(
                          "${widget.model.image}",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: const Icon(IconBroken.Send, color: Colors.green),
                        onPressed: () async {
                          await SocialCubit.get(context).commentPost(
                            commentText: _controller.text,
                            postModel: widget.model,
                            // SocialCubit.get(context).postsId[widget.index]
                          );
                          _controller.clear();
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Write a comment.....",
                            border: InputBorder.none,
                          ),
                          controller: _controller,
                        ),
                      ),
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: () {
                      //       // SocialCubit.get(context).commentPost(
                      //       //   commentText: _controller.text,
                      //       //     postId: widget.model.postId!,
                      //       //     // SocialCubit.get(context).postsId[widget.index]
                      //       // );
                      //     },
                      //     child: const Text(
                      //       "write a comment ...",
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    SocialCubit.get(context).likePost(
                        postModel:
                            SocialCubit.get(context).posts[widget.index]);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        IconBroken.Heart,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Like")
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.share,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    const Text("Share")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
