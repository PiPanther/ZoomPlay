import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoomplay/components/album_rotator.dart';
import 'package:zoomplay/components/profileIcon.dart';
import 'package:zoomplay/components/zoomplay_videoplayer.dart';
import 'package:zoomplay/controller/video_controller.dart';
import 'package:zoomplay/pages/screens/comment_screen.dart';

class HomePageReels extends StatefulWidget {
  const HomePageReels({super.key});

  @override
  State<HomePageReels> createState() => _HomePageReelsState();
}

class _HomePageReelsState extends State<HomePageReels> {
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videoController.videoList.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ZoomPlayerVideoPlayer(
                      videoUrl: videoController.videoList[index].videoUrl),
                  Container(
                    margin: EdgeInsets.only(left: 20, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          videoController.videoList[index].username,
                          style: GoogleFonts.dmSerifText(color: Colors.white),
                        ),
                        Text(
                          videoController.videoList[index].caption,
                          style:
                              GoogleFonts.dmSerifDisplay(color: Colors.white60),
                        ),
                        Text(
                          videoController.videoList[index].songName,
                          style: GoogleFonts.pacifico(color: Colors.white54),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 500,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3,
                          right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(
                            profilePhotourl:
                                videoController.videoList[index].profilePic,
                          ),
                          InkWell(
                            onTap: () {
                              videoController.likedVideo(
                                  videoController.videoList[index].id);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.pinkAccent,
                                ),
                                Text(
                                  videoController.videoList[index].likes.length
                                      .toString(),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CommentScreen(
                                      id: videoController.videoList[index].id),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.comment,
                                  color: Colors.white70,
                                ),
                                Text(
                                  videoController.videoList[index].commentsCount
                                      .toString(),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.reply,
                                  color: Colors.white70,
                                ),
                                Text(
                                  videoController.videoList[index].shareCount
                                      .toString(),
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                          AlbumRotator(
                              profilePicUrl:
                                  videoController.videoList[index].thumbnail)
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
