import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/styles/icon_broken.dart';
import 'package:social_app/shared/styles/size_config.dart';

import 'components/post_item_card.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);
  static String routeName = '/feeds';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.length > 0,
          builder:
              (context) => SingleChildScrollView(
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
                  itemBuilder: (context, index) => PostItemCard(
                    model: SocialCubit.get(context).posts[index],
                    index: index,
                  ),
                  itemCount: SocialCubit.get(context).posts.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8.0,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
