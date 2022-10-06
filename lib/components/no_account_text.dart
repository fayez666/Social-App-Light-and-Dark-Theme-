import 'package:flutter/material.dart';
import 'package:social_app/screens/welcome/welcome_screen.dart';

import '../screens/sign_up/sign_up_screen.dart';
import '../shared/constants.dart';
import '../shared/styles/size_config.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(16),
          ),
        ),
        GestureDetector(
          onTap:()=>Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor
            ),
          ),
        ),
      ],
    );
  }
}

