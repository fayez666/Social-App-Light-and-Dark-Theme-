import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/screens/home/home_screen.dart';
import 'package:social_app/screens/welcome/welcome_screen.dart';
import 'package:social_app/shared/cache_helper.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/routes.dart';
import 'package:social_app/shared/styles/theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  uId  =CacheHelper.getData(key: 'uId');
  Widget widget;

  if(uId != null){
  widget = const HomeScreen();
  }else{
    widget = const WelcomeScreen();
  }
  runApp(MyApp(startWidget:widget,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startWidget});
  final Widget startWidget;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SocialCubit()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat app',
        theme: lightThemeData(context),
        darkTheme: darkThemeData(context),
        routes: routes,
        home: startWidget,
      ),
    );
  }
}
