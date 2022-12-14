class CommentModel {
  String? comment;
  String? uId;
  String? name;
  String? image;
  String? dateTime;
  String? commentId;

  CommentModel({
    required this.comment,
    required this.uId,
    required this.name,
    required this.image,
    required this.dateTime,
    this.commentId,
  });

  CommentModel.fromJson(Map<String, dynamic> jsonData) {
    comment = jsonData["comment"];
    uId = jsonData["uId"];
    name = jsonData["name"];
    image = jsonData["image"];
    dateTime = jsonData["dateTime"];
    commentId = jsonData["commentId"];
  }

  Map<String, dynamic> toMap() {
    return {
      "comment": comment,
      "uId": uId,
      "name": name,
      "image": image,
      "dateTime": dateTime,
    };
  }
}
