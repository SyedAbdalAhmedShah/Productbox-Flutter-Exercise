import 'dart:convert';

class FeedModel {
  factory FeedModel.fromRawJson(String str) =>
      FeedModel.fromJson(json.decode(str));

  final String? userName;
  final String? profileImage;
  final String? postImage;

  FeedModel({
    this.userName,
    this.postImage,
    this.profileImage,
  });

  factory FeedModel.fromJson(Map<String, dynamic> json) {
    return FeedModel(
      userName: json['user_name'],
      profileImage: json['profileImage'],
      postImage: json['postImage'],
    );
  }
}
