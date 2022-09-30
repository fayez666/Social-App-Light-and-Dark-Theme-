import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/cubit/cubit.dart';
import '../../../shared/cubit/states.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).model != null,
          builder: (context) {
           // var model = SocialCubit.get(context).model;
            return Column(
              children: [
                // if (!model!.isEmailVerified!)
                //   Container(
                //     color: Colors.amber.withOpacity(0.6),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 20),
                //       child: Row(
                //         children: [
                //           const Icon(Icons.info_outline),
                //           const SizedBox(
                //             width: 20,
                //           ),
                //           const Expanded(
                //               child: Text("please verify your email")),
                //           const Spacer(),
                //           TextButton(
                //               onPressed: () {
                //                 FirebaseAuth.instance.currentUser
                //                     ?.sendEmailVerification()
                //                     .then((value) {
                //                   Fluttertoast.showToast(
                //                       msg: "Checking your email",
                //                       toastLength: Toast.LENGTH_LONG,
                //                       gravity: ToastGravity.BOTTOM,
                //                       timeInSecForIosWeb: 5,
                //                       backgroundColor: Colors.green,
                //                       textColor: Colors.white,
                //                       fontSize: 16.0);
                //                 }).catchError((error) {});
                //               },
                //               child: const Text("Send"))
                //         ],
                //       ),
                //     ),
                //   )
              ],
            );
          },
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
