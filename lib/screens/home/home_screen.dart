import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/post/new_post_screen.dart';
import 'package:social_app/screens/sign_in/sign_in.dart';
import 'package:social_app/shared/cache_helper.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          Navigator.pushNamed(context, NewPostScreen.routeName);
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                icon: const Icon(IconBroken.Notification),
                onPressed: () {},
              ),
              // IconButton(icon: const Icon(IconBroken.Search), onPressed: () {  },),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  try {
                    String uidUser =  FirebaseAuth.instance.currentUser?.uid ?? "";
                    //await FirebaseAuth.instance.currentUser?.delete();
                    // await FirebaseFirestore.instance
                    //     .collection("users")
                    //     .doc(uidUser)
                    //     .delete();
                    QuerySnapshot<Map<String, dynamic>> docs = await FirebaseFirestore.instance.collection("posts").get();
                    docs.docs.forEach((element) async {
                      if(element.data()["uId"] ==uidUser){
                        await element.reference.delete();
                      }
                    });

                    await FirebaseAuth.instance.signOut();
                    await CacheHelper.clearCacheStorage();
                    cubit.currentIndex = 0;
                    Navigator.of(context)
                        .pushReplacementNamed(SignInScreen.routeName);
                  } catch (error) {
                    print("================================");
                    print(error.toString());
                    print("================================");
                  }
                },
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat), label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Paper_Upload), label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Location), label: 'Users'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
