import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zoomplay/controller/auth_controller.dart';
import 'package:zoomplay/controller/profile_page_controller.dart';

class ProfileScreen extends StatefulWidget {
  String uid;
  ProfileScreen({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    profileController.updateUseId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                title: Text('@${controller.user["name"]}'),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      Get.snackbar("ZoomPlay Video App", "Current Version 1.0");
                    },
                    icon: Icon(Icons.info_outline_rounded),
                  )
                ],
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white70,
              ),
              body: controller.user.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: SafeArea(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: controller.user['profilePic'],
                                    fit: BoxFit.contain,
                                    height: 100,
                                    width: 100,
                                    placeholder: (context, url) => Icon(
                                      Icons.person_outline,
                                      color: Colors.grey,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.user['followers'],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Followers",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.user['following'],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Followings",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.user['likes'],
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Likes",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400))
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            InkWell(
                              onTap: () {
                                if (widget.uid ==
                                    FirebaseAuth.instance.currentUser!.uid) {
                                  authController.logout();
                                } else {
                                  controller.followUser();
                                }
                              },
                              child: Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                        color: Colors.white60, width: 0.6),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  widget.uid ==
                                          FirebaseAuth.instance.currentUser!.uid
                                      ? "Sign Out"
                                      : controller.user['isFollowing']
                                          ? "Follow"
                                          : "Following",
                                  selectionColor: Colors.deepPurpleAccent,
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              indent: 30,
                              endIndent: 30,
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 5),
                                itemCount: controller.user['thumbnails'].length,
                                itemBuilder: (context, index) {
                                  String thumbnail =
                                      controller.user['thumbnails'][index];
                                  return Container(
                                      child: Image(
                                          image: NetworkImage(thumbnail)));
                                  // CachedNetworkImage(
                                  //   fit: BoxFit.cover,
                                  //   imageUrl: thumbnail,
                                  //   errorWidget: (context, url, error) =>
                                  //       Icon(Icons.error),
                                  // );
                                })
                          ],
                        ),
                      ),
                    ));
        });
  }
}
