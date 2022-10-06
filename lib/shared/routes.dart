
import 'package:flutter/material.dart';
import 'package:social_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:social_app/screens/edit_profile/edit_profile_screen.dart';
import 'package:social_app/screens/feeds/feeds_screen.dart';
import 'package:social_app/screens/home/home_screen.dart';
import 'package:social_app/screens/post/new_post_screen.dart';
import 'package:social_app/screens/settings/settings_screen.dart';
import 'package:social_app/screens/sign_in/sign_in.dart';
import 'package:social_app/screens/sign_in_or_sign_up/sign_in_or_sign_up_screen.dart';
import 'package:social_app/screens/users/users_screen.dart';
import 'package:social_app/screens/welcome/welcome_screen.dart';

import '../screens/sign_up/sign_up_screen.dart';

final Map<String,WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  SignInScreen.routeName:(context)=>SignInScreen(),
  SignUpScreen.routeName:(context)=>const SignUpScreen(),
  SignInOrSignUpScreen.routeName:(context)=>const SignInOrSignUpScreen(),
  HomeScreen.routeName:(context)=>const HomeScreen(),
  CompleteProfileScreen.routeName:(context)=>const CompleteProfileScreen(),
  FeedsScreen.routeName :(context)=>const FeedsScreen(),
  UsersScreen.routeName :(context)=>const UsersScreen(),
  SettingsScreen.routeName :(context)=>const SettingsScreen(),
  NewPostScreen.routeName :(context)=>const NewPostScreen(),
  EditProfileScreen.routeName :(context)=> EditProfileScreen(),
};
