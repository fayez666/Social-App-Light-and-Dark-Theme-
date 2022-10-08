import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:social_app/screens/welcome/welcome_screen.dart';
import '../../../components/custom_suffix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/no_account_text.dart';
import '../../../components/social_card.dart';
import '../../../shared/constants.dart';
import '../../../shared/styles/size_config.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
    required this.state,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final SocialLoginStates? state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.04,
              ),
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Sign in with your email and password  \nor continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildEmailTextFormField(),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    buildPassTextFormField(),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          activeColor: kPrimaryColor,
                          onChanged: (value) {},
                        ),
                        const Text("Remember me"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, WelcomeScreen.routeName),
                          child: const Text(
                            "Forgot Password",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    ConditionalBuilder(
                      condition: state is! SocialLoginLoadingState,
                      builder: (context) => DefaultButton(
                          text: "Continue",
                          press: () {
                            if (_formKey.currentState!.validate()) {
                              SocialLoginCubit.get(context).userLogin(
                                email: emailController!.text,
                                password: passwordController!.text,
                                context: context,
                              );
                            }
                          }),
                      fallback: (context) => const CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: 'assets/icons/google-icon.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/facebook-2.svg',
                    press: () {},
                  ),
                  SocialCard(
                    icon: 'assets/icons/twitter.svg',
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const NoAccountText(),
            ],
          ),
        ),
      ),
    ));
  }

  TextFormField buildPassTextFormField() {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kPassNullError;
        } else if (value.length < 7) {
          return kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          border: outlineInputBorder(),
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: const CustomSuffixIcon(svgIcon: 'assets/icons/Lock.svg')),
    );
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          border: outlineInputBorder(),
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: const CustomSuffixIcon(svgIcon: 'assets/icons/Mail.svg')),
    );
  }
}
