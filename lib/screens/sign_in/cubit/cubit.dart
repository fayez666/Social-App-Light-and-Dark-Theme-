import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/shared/cubit/cubit.dart';

import 'states.dart';

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) async {
      await SocialCubit.get(context)..getUserData();
      print(value.user!.email);
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error){
      emit(SocialLoginErrorState(error.toString()));
    });
  }
}
