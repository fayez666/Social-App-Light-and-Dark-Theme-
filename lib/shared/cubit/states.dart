abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;

  SocialGetUserErrorState(this.error);
}

class SocialGetAllUserLoadingState extends SocialStates {}

class SocialGetAllUserSuccessState extends SocialStates {}

class SocialGetAllUserErrorState extends SocialStates {
  final String error;

  SocialGetAllUserErrorState(this.error);
}

class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates {
  final String error;

  SocialGetPostsErrorState(this.error);
}

class SocialChangeBottomNavState extends SocialStates {}

class SocialNewPostState extends SocialStates {}

class SocialProfileImageSuccessState extends SocialStates {}

class SocialProfileImageErrorState extends SocialStates {}

class SocialCoverImageSuccessState extends SocialStates {}

class SocialCoverImageErrorState extends SocialStates {}

class SocialCreatePostImageSuccessState extends SocialStates {}

class SocialCreatePostImageErrorState extends SocialStates {}

class SocialUserUpdateLoadingState extends SocialStates {}

class SocialUserUpdateErrorState extends SocialStates {}

class SocialUploadProfileImageSuccessState extends SocialStates {}

class SocialUploadProfileImageErrorState extends SocialStates {}

class SocialUploadProfileCoverSuccessState extends SocialStates {}

class SocialUploadProfileCoverErrorState extends SocialStates {}

class SocialCreatePostLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostErrorState extends SocialStates {}

class SocialLikePostInitState extends SocialStates {}


// class SocialCommentPostInitState extends SocialStates {}
// class SocialCommentPostSuccessState extends SocialStates {}
// class SocialCommentPostInitState extends SocialStates {}

class SocialLikePostSuccessState extends SocialStates {}

class SocialLikePostErrorState extends SocialStates {
  final String error;

  SocialLikePostErrorState(this.error);
}
class SocialCommentPostInitState extends SocialStates {}

class SocialCommentPostSuccessState extends SocialStates {}

class SocialCommentPostErrorState extends SocialStates {
  final String error;

  SocialCommentPostErrorState(this.error);
}

class SocialRemovePostImageState extends SocialStates {}

class SocialSendMessageSuccessState extends SocialStates {}

class SocialSendMessageErrorState extends SocialStates {}

class SocialGetMessagesSuccessState extends SocialStates {}

class SocialGetMessagesErrorState extends SocialStates {}
