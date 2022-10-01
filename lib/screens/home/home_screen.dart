import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/post/new_post_screen.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/styles/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName ='/home';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){
        if(state is SocialNewPostState){
          Navigator.pushNamed(context, NewPostScreen.routeName);
        }
      },
      builder: (context,state){
        var cubit =SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text(
              cubit.titles[cubit.currentIndex]
            ),
            actions: [
              IconButton(icon: const Icon(IconBroken.Notification), onPressed: () {  },),
              IconButton(icon: const Icon(IconBroken.Search), onPressed: () {  },),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                label: 'Home'
              ),
              BottomNavigationBarItem(icon: Icon(IconBroken.Chat),
                  label: 'Chats'),
              BottomNavigationBarItem(icon: Icon(IconBroken.Paper_Upload),
                  label: 'Post'),
              BottomNavigationBarItem(icon: Icon(IconBroken.Location),
                  label: 'Users'),
              BottomNavigationBarItem(icon: Icon(IconBroken.Setting),
                  label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
