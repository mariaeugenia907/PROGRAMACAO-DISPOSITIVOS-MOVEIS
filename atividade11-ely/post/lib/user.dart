class User {
  int? userId;
  int? id;
  String? title;
  String? body;

  User({this.userId, this.id, this.title, this.body});

  User.fromJson(Map json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
}

class User2 {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  User2({this.postId, this.id, this.name, this.email, this.body});

  User2.fromJson(Map json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}