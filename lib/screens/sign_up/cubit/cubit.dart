import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/screens/sign_up/cubit/states.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    emit(SocialRegisterLoadingState());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await userCreate(
        phone: phone,
          name: name,
          email: email,
          uId: userCredential.user?.uid ?? "uid");

      emit(SocialCreateUserSuccessState());
    } catch (error) {
      print(" =============================== Error message");
      print(error.toString());
      emit(SocialCreateUserErrorState(error.toString()));
    }
  }

  Future<void> userCreate({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) async {
    UserModel model =
        UserModel(
            email: email,
            uId: uId,
            phone: phone,
            name: name,
            isEmailVerified: false,
        );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap());
  }

  Future<void> userUpdateData({
    required String name,
    required String phone,
    required String uId,

  }) async {
    UserModel model =
    UserModel(name: name,phone: phone);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap());
  }
}
