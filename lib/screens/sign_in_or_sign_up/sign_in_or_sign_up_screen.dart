import 'package:flutter/material.dart';
import 'package:social_app/screens/sign_in/sign_in.dart';
import 'package:social_app/screens/sign_up/sign_up_screen.dart';

import '../../components/primary_button.dart';
import '../../shared/constants.dart';

class SignInOrSignUpScreen extends StatelessWidget {
  const SignInOrSignUpScreen({Key? key}) : super(key: key);
  static String routeName = '/inorup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/Logo_light.png"
                    : "assets/images/Logo_dark.png",
                height: 146,
              ),
              const Spacer(),
              PrimaryButton(
                  text: "Sign In",
                  press: () =>
                      Navigator.pushNamed(context, SignInScreen.routeName)),
              const SizedBox(
                height: kDefaultPadding * 1.5,
              ),
              PrimaryButton(
                text: "Sign Up",
                press: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                },
                color: Theme.of(context).colorScheme.secondary,
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
