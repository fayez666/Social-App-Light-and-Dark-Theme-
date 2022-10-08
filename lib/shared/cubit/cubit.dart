import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:social_app/models/comment_model.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';
import 'package:social_app/screens/chats/chats_screen.dart';
import 'package:social_app/screens/feeds/feeds_screen.dart';
import 'package:social_app/screens/post/new_post_screen.dart';
import 'package:social_app/screens/settings/settings_screen.dart';
import 'package:social_app/screens/users/users_screen.dart';
import 'package:social_app/shared/constants.dart';
import 'package:social_app/shared/cubit/states.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../models/message.dart';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  UserModel? model;
  int currentIndex = 0;
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatsScreen(),
    NewPostScreen(),
    const UsersScreen(),
    const SettingsScreen()
  ];
  List<String> titles = ['Home', 'Chats', 'Post', "Users", "Settings"];

  void getUserData() {
    print("/////////////////////////////////////////////////////");
    print("Get user data function");
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print("/////////////////////////////////////////////////////");
      print("Map Data of firebase");
      print(value.data());
      model = UserModel.fromJson(value.data()!);
      print("/////////////////////////////////////////////////////");
      print("Success Add User Data");
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(SocialGetUserErrorState(error.toString()));
    });
  }

  void changeBottomNav(int index) {
    // if(index ==0){
    //   getPosts();
    // }
    if (index == 1) {
      getUsers();
    }
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  File? profileImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImageSuccessState());
    } else {
      log("No Images selected");
      emit(SocialProfileImageErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadProfileImageSuccessState());
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((onError) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((onError) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImageSuccessState());
    } else {
      log("No Images selected");
      emit(SocialCoverImageErrorState());
    }
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        // emit(SocialUploadProfileCoverSuccessState());
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
      }).catchError((error) {
        emit(SocialUploadProfileCoverErrorState());
      });
    }).catchError((onError) {
      emit(SocialUploadProfileCoverErrorState());
    });
  }

  // void updateUserData({
  //   required String name,
  //   required String phone,
  //   required String bio,
  // }) {
  //   emit(SocialUserUpdateLoadingState());
  //   if (coverImage != null) {
  //     uploadCoverImage();
  //   } else if (profileImage != null) {
  //     uploadProfileImage();
  //   } else if (coverImage != null && profileImage != null) {
  //   } else {
  //     updateUser(name: name, phone: phone, bio: bio);
  //   }
  // }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    UserModel userModel = UserModel(
        name: name,
        phone: phone,
        bio: bio,
        cover: cover ?? model?.cover,
        image: image ?? model?.image,
        isEmailVerified: false,
        email: model?.email,
        uId: model?.uId);

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .update(userModel.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }

  File? postImage;

  Future<void> getPostImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialCreatePostImageSuccessState());
    } else {
      log("No Images selected");
      emit(SocialCreatePostImageErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(SocialRemovePostImageState());
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
    required BuildContext context,
  }) {
    emit(SocialCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        createPost(
            dateTime: dateTime, text: text, postImage: value, context: context);
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((onError) {
      emit(SocialCreatePostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
    required BuildContext context,
  }) {
    emit(SocialCreatePostLoadingState());
    PostModel postModel = PostModel(
      name: model?.name,
      image: model?.image,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? "",
      uId: model?.uId,
      likeCount: 0,
      commentCount: 0,
      likes: {},
    );

    FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toMap())
        .then((value) async {
      await value.update({"postId": value.id});
      SocialCubit.get(context).getPosts();

      emit(SocialCreatePostSuccessState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];

  // List<int> likes = [];
  List<CommentModel> comments = [];

  // List<int> comments = [];

  void getPosts() {
    posts = [];
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        posts.add(PostModel.fromJson(element.data()));
        // element.reference.collection('likes').get().then((value) {
        //   likes.add(value.docs.length);
        //   postsId.add(element.id);
        //   posts.add(PostModel.fromJson(element.data()));
        // }).catchError((error) {});
        // element.reference.collection('comments').get().then((value) {
        //   // comments.add(value.docs.length);
        //   //postsId.add(element.id);
        //   //posts.add(PostModel.fromJson(element.data()));
        //   emit(SocialGetPostsSuccessState());
        // }).catchError((error) {});
      });
      emit(SocialGetPostsSuccessState());
    }).catchError((error) {
      emit(SocialGetPostsErrorState(error.toString()));
    });
  }

  // void likePost(String postId) {
  //   FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(postId)
  //       .collection('likes')
  //       .doc(model?.uId)
  //       .set({
  //     "like": true,
  //   }).then((value) {
  //     emit(SocialLikePostSuccessState());
  //   }).catchError((error) {
  //     emit(SocialLikePostErrorState(error.toString()));
  //   });
  // }

  Future likePost({required PostModel postModel}) async {
    if (postModel.likes!.containsKey(model!.uId)) {
      emit(SocialLikePostInitState());
      bool _isLiked = postModel.likes![model!.uId];
      if (_isLiked) {
        await FirebaseFirestore.instance
            .collection("posts")
            .doc(postModel.postId)
            .update({
          "likes.${model!.uId!}": false,
          "likeCount": (postModel.likeCount! - 1),
        }).then((value) {
          postModel!.likeCount = postModel.likeCount! - 1;
          postModel.likes![model!.uId] = false;
        }).catchError((error) {
          print(error.toString());
        });

        emit(SocialLikePostSuccessState());
      } else {
        await FirebaseFirestore.instance
            .collection("posts")
            .doc(postModel.postId)
            .update({
          "likes.${model!.uId!}": true,
          "likeCount": (postModel.likeCount! + 1),
        }).then((value) {
          postModel.likeCount = postModel.likeCount! + 1;
          postModel.likes![model!.uId] = true;
        }).catchError((error) {
          print(error.toString());
        });

        emit(SocialLikePostSuccessState());
      }
    } else {
      await FirebaseFirestore.instance
          .collection("posts")
          .doc(postModel.postId)
          .update({
        "likes.${model!.uId!}": true,
        "likeCount": (postModel.likeCount! + 1),
      }).then((value) {
        postModel.likes![model!.uId] = true;
        postModel!.likeCount = postModel.likeCount! + 1;
      }).catchError((error) {
        print(error.toString());
      });

      emit(SocialLikePostSuccessState());
    }
  }

  Future<void> getComments({required String postId}) async {
    emit(SocialCommentPostInitState());
    comments = [];

    await FirebaseFirestore.instance
        .collection("posts")
        .doc(postId)
        .collection("comments")
        .orderBy("dateTime", descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
        comments.add(CommentModel.fromJson(element.data()));
      });
      emit(SocialCommentPostSuccessState());
    }).catchError((error) {
      emit(SocialCommentPostErrorState(error.toString()));
      print(error.toString());
    });
  }

  Future<void> commentPost(
      {required PostModel postModel, required String commentText}) async {
    String formattedDate =
        DateFormat('d MMMM - kk:mm:ss').format(DateTime.now());
    CommentModel commentModel = CommentModel(
      comment: commentText,
      dateTime: formattedDate,
      uId: model!.uId,
      name: model!.name,
      image: model!.image,
    );

    await FirebaseFirestore.instance
        .collection("posts")
        .doc(postModel.postId)
        .update({"commentCount": (postModel.commentCount! + 1)});
    postModel.commentCount = postModel.commentCount! + 1;
    await FirebaseFirestore.instance
        .collection("posts")
        .doc(postModel.postId)
        .collection("comments")
        .add(commentModel.toMap())
        .then((value) {
      value.update({
        "commentId": value.id,
      });
      commentModel.commentId = value.id;

      comments.insert(0, commentModel);

      emit(SocialCommentPostSuccessState());
    }).catchError((error) {
      emit(SocialCommentPostErrorState(error.toString()));
      print(error.toString());
    });

    // FirebaseFirestore.instance
    //     .collection('posts')
    //     .doc(postId)
    //     .collection('comments')
    //     .doc(model?.uId)
    //     .set({
    //   "comment": true,
    // }).then((value) {
    //   emit(SocialCommentPostSuccessState());
    // }).catchError((error) {
    //   emit(SocialCommentPostErrorState(error.toString()));
    // });
  }

  // void commentPost(String postId) {
  //   FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(postId)
  //       .collection('comments')
  //       .doc(model?.uId)
  //       .set({
  //     "comment": true,
  //   }).then((value) {
  //     emit(SocialCommentPostSuccessState());
  //   }).catchError((error) {
  //     emit(SocialCommentPostErrorState(error.toString()));
  //   });
  // }

  List<UserModel> users = [];

  void getUsers() {
    if (users.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['uId'] != model?.uId) {
            users.add(UserModel.fromJson(element.data()));
          }
        });
        emit(SocialGetAllUserSuccessState());
      }).catchError((error) {
        emit(SocialGetAllUserErrorState(error.toString()));
      });
    }
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel messageModel = MessageModel(
        senderId: model!.uId!,
        receiverId: receiverId,
        dateTime: dateTime,
        text: text);
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uId!)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error) {
      emit(SocialSendMessageErrorState());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(model!.uId!)
        .collection('messages')
        .add(messageModel.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error) {
      emit(SocialSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({required String receiverId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(model?.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .snapshots()
        .listen((event) {
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialGetMessagesSuccessState());
    });
  }
}
