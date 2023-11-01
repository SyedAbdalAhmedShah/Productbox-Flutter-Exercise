import 'package:productbox_flutter_exercise/models/feeds_model.dart';

class DashboardRepository {
  List<FeedModel> getUserData() {
    final List<Map<String, dynamic>> data = [
      {
        "user_name": "Syed Abdal",
        "postImage": "assets/images/laptop.jpg",
        'profileImage': 'assets/images/1.jpeg'
      },
      {
        "user_name": "Syed Shabir",
        "postImage": "assets/images/laptop2.jpg",
        "profileImage": "assets/images/2.jpeg"
      },
      {
        "user_name": "Fahad Ali",
        "postImage": "assets/images/laptop3.jpg",
        "profileImage": "assets/images/3.jpeg"
      },
      {
        "user_name": "Ali Bukhari",
        "postImage": "assets/images/laptop4.jpg",
        "profileImage": "assets/images/4.jpeg"
      },
      {
        "user_name": "Ammar Khan",
        "postImage": "assets/images/laptop5.jpg",
        "profileImage": "assets/images/5.jpeg"
      },
      {
        "user_name": "Sikandar Shah",
        "postImage": "assets/images/laptop6.jpg",
        "profileImage": "assets/images/person.jpeg"
      },
      {
        "user_name": "Noreen Fatima",
        "postImage": "assets/images/laptop7.jpg",
        "profileImage": "assets/images/women.jpeg"
      },
      {
        "user_name": "Hamza Khan",
        "postImage": "assets/images/laptop8.jpg",
        "profileImage": "assets/images/person2.jpeg"
      },
      {
        "user_name": "Faizan Badshah",
        "postImage": "assets/images/laptop9.jpg",
        'profileImage': 'assets/images/pic.jpeg'
      },
    ];
    List<FeedModel> list = [];
    for (var i = 0; i < data.length; i++) {
      FeedModel model = FeedModel.fromJson(data[i]);
      list.add(model);
    }
    return list;
  }
}
