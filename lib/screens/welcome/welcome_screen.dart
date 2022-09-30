import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../sign_in_or_sign_up/sign_in_or_sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset('assets/images/welcome_image.png'),
          const Spacer(
            flex: 3,
          ),
          Text(
            "Welcome to our freedom \n messaging app",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(
            "Freedom talk any person of your \n mother language",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .color!
                    .withOpacity(0.64)),
          ),
          const Spacer(
            flex: 2,
          ),
          FittedBox(
            child: TextButton(
                onPressed: () => Navigator.pushNamed(
                      context,
                      SignInOrSignUpScreen.routeName,
                    ),
                child: Row(
                  children: [
                    Text(
                      "Skip",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.8)),
                    ),
                    const SizedBox(
                      width: kDefaultPadding / 4,
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 16,
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.8))
                  ],
                )),
          )
        ],
      )),
    );
  }
}
