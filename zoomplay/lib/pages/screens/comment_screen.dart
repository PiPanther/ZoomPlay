import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomplay/controller/comment_controller.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatefulWidget {
  final String id;
  const CommentScreen({required this.id});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController commentControllertext = TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    commentController.updatePostID(widget.id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Comments",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SizedBox(
          width: screenSize.width,
          height: screenSize.height * 0.90,
          child: Column(
            children: [
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: commentController.comments.length,
                    itemBuilder: (context, index) {
                      final comment = commentController.comments[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(comment.profilepic),
                          backgroundColor: Colors.grey,
                        ),
                        title: Row(
                          children: [
                            Text(
                              comment.username,
                              style: GoogleFonts.pacifico(color: Colors.grey),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              comment.comment,
                              style: TextStyle(
                                  color: Colors.grey.shade300, fontSize: 13),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            Text(tago.format(comment.datepub.toDate())),
                            SizedBox(
                              width: 15,
                            ),
                            Text(comment.likes.length.toString()),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {
                            commentController.likeComment(comment.id);
                          },
                          child: Icon(
                            Icons.favorite,
                            color: (comment.likes.contains(
                                    FirebaseAuth.instance.currentUser!.uid)
                                ? Colors.red
                                : Colors.grey),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
              Divider(
                color: Colors.transparent,
              ),
              ListTile(
                title: TextField(
                  style: TextStyle(color: Colors.grey.shade300),
                  controller: commentControllertext,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelText: 'Add a comment',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                trailing: TextButton(
                    onPressed: () {
                      commentController
                          .postComment(commentControllertext.text.trim());
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.grey),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
