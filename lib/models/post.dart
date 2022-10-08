class PostModel {
  String? postId;
  String? name;
  String? uId;
  String? image;
  String? dateTime;
  String? text;
  String? postImage;
  Map? likes;
  int? likeCount;
  int? commentCount;

  PostModel({
    this.postId,
    this.name,
    this.uId,
    this.image,
    this.dateTime,
    this.text,
    this.postImage,
    required this.likeCount,
    required this.likes,
    required this.commentCount,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json["postId"];
    name = json["name"];
    uId = json["uId"];
    image = json["image"];
    dateTime = json["dateTime"];
    text = json["text"];
    postImage = json["postImage"];
    likes = json["likes"];
    likeCount = json["likeCount"];
    commentCount = json["commentCount"] ?? 0;
  }

  Map<String, dynamic> toMap() {
    return {
      "postId": postId,
      "name": name,
      "uId": uId,
      "image": image,
      "dateTime": dateTime,
      "text": text,
      "postImage": postImage,
      "likes": likes,
      "likeCount": likeCount,
      "commentCount": commentCount,
    };
  }
}
