import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/components/default_button.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/shared/cubit/cubit.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:social_app/shared/styles/size_config.dart';
import '../../shared/constants.dart';
import '../../shared/styles/icon_broken.dart';
import '../settings/components/profile_cover.dart';
import '../settings/components/profile_picture.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/profile";
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialCubit.get(context).model;
        var profileImage = SocialCubit.get(context).profileImage;
        var coverImage = SocialCubit.get(context).coverImage;
        if (userModel == null) {
          return const Text("data");
        }
        nameController.text = userModel.name!;
        phoneController.text = userModel.phone!;
        bioController.text = userModel.bio!;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconBroken.Arrow___Left_2),
            ),
            title: const Text("Edit Profile"),
            actions: [
              TextButton(
                  onPressed: () {
                    SocialCubit.get(context).updateUser(
                        name: nameController.text,
                        phone: phoneController.text,
                        bio: bioController.text);
                  },
                  child: const Text(
                    "Update",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is SocialUserUpdateLoadingState)
                    const LinearProgressIndicator(),
                  if (state is SocialUserUpdateLoadingState)
                    const SizedBox(
                      height: 10,
                    ),
                  SizedBox(
                    height: 190.0,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        ProfileCover(
                          model: userModel,
                          coverImage: coverImage,
                        ),
                        ProfilePicture(
                          model: userModel,
                          profileImage: profileImage,
                        ),
                      ],
                    ),
                  ),
                  if (SocialCubit.get(context).profileImage != null ||
                      SocialCubit.get(context).coverImage != null)
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.04,
                    ),
                  if (SocialCubit.get(context).profileImage != null ||
                      SocialCubit.get(context).coverImage != null)
                    Row(
                      children: [
                        if (SocialCubit.get(context).profileImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                DefaultButton(
                                  text: "Upload Profile",
                                  press: () {
                                    SocialCubit.get(context).uploadProfileImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text);
                                  },
                                ),
                                if (state is SocialUserUpdateLoadingState)
                                  const SizedBox(
                                    height: 6,
                                  ),
                                if (state is SocialUserUpdateLoadingState)
                                  const LinearProgressIndicator(),
                              ],
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (SocialCubit.get(context).coverImage != null)
                          Expanded(
                            child: Column(
                              children: [
                                DefaultButton(
                                  text: "Upload Cover",
                                  press: () {
                                    SocialCubit.get(context).uploadCoverImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text);
                                  },
                                ),
                                if (state is SocialUserUpdateLoadingState)
                                  const SizedBox(
                                    height: 6,
                                  ),
                                if (state is SocialUserUpdateLoadingState)
                                  const LinearProgressIndicator(),
                              ],
                            ),
                          ),
                      ],
                    ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  buildNameField(model: userModel),
                  const SizedBox(
                    height: 20,
                  ),
                  buildBioField(model: userModel),
                  const SizedBox(
                    height: 20,
                  ),
                  buildPhoneField(model: userModel)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  TextFormField buildNameField({required UserModel model}) {
    return TextFormField(
      controller: nameController,
      validator: (value) {
        if (value!.isEmpty) {
          return kNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        labelText: "Name",
        hintText: "${model.name}",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(IconBroken.User),
      ),
    );
  }

  TextFormField buildPhoneField({required UserModel model}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: phoneController,
      validator: (value) {
        if (value!.isEmpty) {
          return kPhoneNumberNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        labelText: "Phone",
        hintText: "${model.phone}",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(IconBroken.Call),
      ),
    );
  }

  TextFormField buildBioField({required UserModel model}) {
    return TextFormField(
      controller: bioController,
      validator: (value) {
        if (value!.isEmpty) {
          return kNameNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        border: outlineInputBorder(),
        labelText: "Bio",
        hintText: "${model.bio}",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: const Icon(IconBroken.Info_Circle),
      ),
    );
  }
}
