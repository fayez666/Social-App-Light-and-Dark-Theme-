import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/screens/home/home_screen.dart';
import 'package:social_app/shared/cache_helper.dart';
import '../../shared/styles/size_config.dart';
import 'components/body.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";

  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit, SocialLoginStates>(
        listener: (context, state) {
          if (state is SocialLoginErrorState) {
            Fluttertoast.showToast(
                msg: state.error,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
          if (state is SocialLoginSuccessState) {
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId
            ).then((value) {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.routeName, (route) => false);
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(centerTitle: true, title: const Text("Sign In")),
            body: Body(
              formKey: _formKey,
              emailController: emailController,
              passwordController: passwordController,
              state: state,
            ),
          );
        },
      ),
    );
  }
}
