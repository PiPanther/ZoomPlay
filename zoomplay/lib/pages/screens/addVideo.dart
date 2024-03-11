import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';
import 'package:zoomplay/pages/screens/addCaption.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.back();
      Get.snackbar(
        "Video Selected",
        video.path,
        colorText: Colors.white,
        icon: LottieBuilder.asset('lib/assets/logo.json'),
      );
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return addCaption_Screen(
            videoFile: File(video.path), videoPath: video.path);
      }));
      // Get.off(AddCaption(videoFile: File(video.path), videoPath: video.path));
    } else {
      Get.snackbar("Error!",
          "Please choose a different video file. If the problem persists please restart your app.",
          colorText: Colors.white);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            Get.defaultDialog(
              title: "Upload Video",
              titlePadding: const EdgeInsets.only(top: 20),
              // radius: BorderSide.strokeAlignOutside,
              backgroundColor: Colors.white,
              actions: [
                TextButton.icon(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.cancel_outlined),
                    label: Text("Cancel"))
              ],
              content: Column(
                children: [
                  _buildOptionItem('Upload from Gallery', Icons.photo_library,
                      () {
                    pickVideo(ImageSource.gallery,
                        context); // Handle upload from gallery
                  }),
                  _buildOptionItem('Take a Photo', Icons.camera_alt, () {
                    pickVideo(ImageSource.camera, context);
                    // Handle taking a photo
                  }),
                ],
              ),
            );
          },
          child: const Center(
            child: Text(
              "Tap anywhere to upload video",
              style: TextStyle(color: Colors.white60),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionItem(
      String title, IconData icon, void Function() onPressed) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onPressed,
    );
  }
}
