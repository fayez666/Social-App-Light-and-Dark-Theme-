import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';

import '../../../shared/constants.dart';
import '../../../shared/styles/icon_broken.dart';
import '../../../shared/styles/size_config.dart';

class PostItemCard extends StatelessWidget {
  const PostItemCard({
    Key? key, required this.model,
  }) : super(key: key);

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8.0)),
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
                    "${model.image}",
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
                              "${model.name}",
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
                          "${model.dateTime}",
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
            Text(
                "${model.text}"),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                top: 5,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 6.0,
                    ),
                    child: SizedBox(
                      height: 20,
                      child: MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: const Text(
                            "#photoshop",
                            style: TextStyle(color: kPrimaryColor),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 6.0,
                    ),
                    child: SizedBox(
                      height: 20,
                      child: MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: const Text(
                            "#video",
                            style: TextStyle(color: kPrimaryColor),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 6.0,
                    ),
                    child: SizedBox(
                      height: 20,
                      child: MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: const Text(
                            "#software",
                            style: TextStyle(color: kPrimaryColor),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 6.0,
                    ),
                    child: SizedBox(
                      height: 20,
                      child: MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: const Text(
                            "#photoshop",
                            style: TextStyle(color: kPrimaryColor),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      end: 8.0,
                    ),
                    child: SizedBox(
                      height: 20,
                      child: MaterialButton(
                          padding: EdgeInsets.zero,
                          minWidth: 1,
                          onPressed: () {},
                          child: const Text(
                            "#photoshop",
                            style: TextStyle(color: kPrimaryColor),
                          )),
                    ),
                  ),
                ]),
              ),
            ),
            if(model.postImage != '')
             Padding(
              padding: const EdgeInsets.only(top :15),
              child: Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: DecorationImage(
                        image: NetworkImage("${model.postImage}"),
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
                          const Text("0")
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
                            onTap: () {},
                            child: const Icon(
                              IconBroken.Chat,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Text("0 comments")
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
                          "${model.image}",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        IconBroken.Send,
                        color: Colors.green,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: (){},
                          child: const Text(
                            "write a comment ...",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
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
                    const Text("Like")
                  ],
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
