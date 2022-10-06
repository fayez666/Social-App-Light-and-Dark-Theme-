import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/shared/styles/icon_broken.dart';
import 'package:social_app/shared/styles/size_config.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  static String routeName = '/feeds';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5.0,
            margin: EdgeInsets.all(getProportionateScreenWidth(8.0)),
            child: Stack(
              children: [
                const Image(
                  image: NetworkImage(
                      "https://img.freepik.com/free-photo/horizontal-shot-positive-woman-with-curly-bushy-hair-points-left-blank-space-shows-direction-place-your-advertising-content-holds-mobile-phone-dressed-striped-jumper-jacket_273609-62533.jpg?w=996&t=st=1664411636~exp=1664412236~hmac=643450109a1443fa1ed9174373008091d60803060aec52871bc8771acf1fad62"),
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Communicate With friends",
                    style: GoogleFonts.cookie(fontSize: 26),
                  ),
                )
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder:(context,index)=> const PostItemCard(),
            itemCount: 10,
            separatorBuilder: (context,index)=>const SizedBox(
              height: 8.0,
            ),
          ),
          const SizedBox(height: 8.0,),
        ],
      ),
    );
  }
}

class PostItemCard extends StatelessWidget {
  const PostItemCard({
    Key? key,
  }) : super(key: key);

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
          children: [
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
                      children: [
                        const Text(
                          "Abdallah Fayez",
                          style: TextStyle(
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
                    const Text(
                      "Thursday 29 , 2022 at 3:03 am",
                      style: TextStyle(fontSize: 12, height: 1.4),
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
            const Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
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
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: const DecorationImage(
                      image: AssetImage(
                        "assets/images/Video Place Here.png",
                      ),
                      fit: BoxFit.cover)),
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
                          const Text("1200")
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
                          const Text("521 comments")
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
                      const CircleAvatar(
                        radius: 15.0,
                        backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-photo/surprised-young-pretty-girl-points-up-isolated-blue-wall-with-copy-space_141793-78592.jpg?w=900&t=st=1664412431~exp=1664413031~hmac=8432a3a19bc6100f15f458914ff141abfd44434922eb63f0cb9a3e62177913dd",
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
