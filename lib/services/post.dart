import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'database.dart';

class Post {
  String body;
  String author;
  DatabaseReference _id;
  bool updated = false;

  Post({this.body, this.author});

  void setId(DatabaseReference id) {
    this._id = id;
  }

  DatabaseReference getId() {
    return this._id;
  }

  void update() {
    updated = true;
    updatePost(this, this._id);
  }

  Map<String, dynamic> toJson() {
    final DateTime now = DateTime.now();

    return {
      'author': this.author,
      'usersLiked': 0,
      'body': this.body,
      'date': now.toString(),
      'updated': updated
    };
  }
}

Post createPost(record) {
  Map<String, dynamic> attributes = {'author': '', 'body': '', 'updated': ''};
  record.forEach((key, value) => {attributes[key] = value});
  Post post = new Post(body: attributes['body'], author: attributes['author']);

  return post;
}
