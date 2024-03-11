import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  String username;
  String comment;
  final datepub;
  List likes;
  String userid;
  String profilepic;
  String id;

  Comment(
      {required this.username,
      required this.comment,
      required this.datepub,
      required this.likes,
      required this.userid,
      required this.id,
      required this.profilepic});

  Map<String, dynamic> toJson() => {
        'username': username,
        'comment': comment,
        'datepub': datepub,
        'likes': likes,
        'profilePic': profilepic,
        'uid': userid,
        'id': id,
      };

  static Comment fromSnapshot(DocumentSnapshot documentSnapshot) {
    var commentSnapshot = documentSnapshot.data() as Map<String, dynamic>;
    return Comment(
        username: commentSnapshot['username'],
        comment: commentSnapshot['comment'],
        datepub: commentSnapshot['datepub'],
        likes: commentSnapshot['likes'],
        userid: commentSnapshot['uid'],
        id: commentSnapshot['id'],
        profilepic: commentSnapshot['profilePic']);
  }
}
