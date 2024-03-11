// import 'dart:ffi';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:zoomplay/models/comment.dart';

// class CommentController extends GetxController {
//   final Rx<List<Comment>> _comment = Rx<List<Comment>>([]);
//   String _postID = "";
//   List<Comment> get comments => _comment.value;
//   updatePostId(String id) {
//     _postID = id;
//     fetchComment();
//   }

//   fetchComment() async {
//     if (_postID == "") return;
//     _comment.bindStream(
//       FirebaseFirestore.instance
//           .collection("videos")
//           .doc(_postID)
//           .collection("comments")
//           .snapshots()
//           .map(
//         (QuerySnapshot querySnapshot) {
//           List<Comment> retVal = [];
//           for (var element in querySnapshot.docs) {
//             retVal.add(Comment.fromSnapshot(element));
//           }
//           return retVal;
//         },
//       ),
//     );
//   }

//   postComment(String commentText) async {
//     try {
//       if (commentText.isNotEmpty) {
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection("users")
//             .doc(FirebaseAuth.instance.currentUser!.uid.toString())
//             .get();

//         var allDocs = await FirebaseFirestore.instance
//             .collection("videos")
//             .doc(_postID)
//             .collection("comment")
//             .get();
//         var length = allDocs.docs.length;
//         Comment comment = Comment(
//             username: (userDoc.data() as dynamic)['name'],
//             comment: commentText.trim(),
//             datepub: DateTime.now(),
//             likes: [],
//             userid: FirebaseAuth.instance.currentUser!.uid,
//             id: 'Comment $length  ',
//             profilepic: (userDoc.data() as dynamic)['profilePic']);
//         await FirebaseFirestore.instance
//             .collection("videos")
//             .doc(_postID)
//             .collection("comment")
//             .doc('Comment $length')
//             .set(comment.toJson());
//         DocumentSnapshot doc = await FirebaseFirestore.instance
//             .collection('videos')
//             .doc(_postID)
//             .get();
//         await FirebaseFirestore.instance
//             .collection('videos')
//             .doc(_postID)
//             .update({
//           'commentsCount': (doc.data() as dynamic)['commentsCount'] + 1,
//         });
//          Get.snackbar("Success","Comment Added Successfully");
//       }
//     } catch (e) {
//       Get.snackbar("Error Occured", e.toString());
//     }
//   }

//   likeComment() {}
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:zoomplay/models/comment.dart';

class CommentController extends GetxController {
  final Rx<List<Comment>> _comments = Rx<List<Comment>>([]);
  List<Comment> get comments => _comments.value;
  String _postID = "";
  updatePostID(String id) {
    _postID = id;
    fetchComment();
  }

  fetchComment() async {
    _comments.bindStream(FirebaseFirestore.instance
        .collection("videos")
        .doc(_postID)
        .collection("comments")
        .snapshots()
        .map((QuerySnapshot query) {
      List<Comment> retVal = [];
      for (var element in query.docs) {
        retVal.add(Comment.fromSnapshot(element));
      }
      return retVal;
    }));
  }

  postComment(String commentText) async {
    try {
      if (commentText.isNotEmpty) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid.toString())
            .get();

        // Get.snackbar("got userdoc", "message");
        var allDocs = await FirebaseFirestore.instance
            .collection("videos")
            .doc(_postID)
            .collection("comments")
            .get();
        int len = allDocs.docs.length;

        Comment comment = Comment(
            username: (userDoc.data() as dynamic)['name'],
            comment: commentText.trim(),
            datepub: DateTime.now(),
            likes: [],
            profilepic: (userDoc.data() as dynamic)['profile_photo'],
            userid: FirebaseAuth.instance.currentUser!.uid,
            id: 'Comment $len');
        // Get.snackbar("set cooment", "message");

        await FirebaseFirestore.instance
            .collection("videos")
            .doc(_postID)
            .collection("comments")
            .doc('Comment $len')
            .set(comment.toJson());
        // Get.snackbar("saved cooment", "message");

        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('videos')
            .doc(_postID)
            .get();
        await FirebaseFirestore.instance
            .collection('videos')
            .doc(_postID)
            .update({
          'commentsCount': (doc.data() as dynamic)['commentsCount'] + 1,
        });
        Get.snackbar("Done", "Comment added successfully!");
      } else {
        Get.snackbar(
            "Please Enter some content", "Please write something in comment");
      }
    } catch (e) {
      Get.snackbar("Error in sending comment", e.toString());
    }
  }

  likeComment(String id) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('videos')
        .doc(_postID)
        .collection("comments")
        .doc(id)
        .get();

    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await FirebaseFirestore.instance
          .collection('videos')
          .doc(_postID)
          .collection('comments')
          .doc(id)
          .update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await FirebaseFirestore.instance
          .collection('videos')
          .doc(_postID)
          .collection('comments')
          .doc(id)
          .update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }
}
