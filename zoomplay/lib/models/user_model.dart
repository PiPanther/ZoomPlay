import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String name;
  String profilePhoto;
  String email;
  String uid;

  MyUser(
      {required this.name,
      required this.email,
      required this.uid,
      required this.profilePhoto});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "profile_photo": profilePhoto,
    };
  }

  static MyUser fromSnap(DocumentSnapshot documentSnapshot) {
    var snapshot = documentSnapshot.data() as Map<String, dynamic>;
    return MyUser(
        name: snapshot["name"],
        email: snapshot["email"],
        uid: snapshot["uid"],
        profilePhoto: snapshot["profile_photo"]);
  }
}
