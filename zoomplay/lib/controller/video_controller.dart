import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:zoomplay/controller/auth_controller.dart';
import 'package:zoomplay/models/video_model.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);

  List<Video> get videoList => _videoList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _videoList.bindStream(FirebaseFirestore.instance
        .collection("videos")
        .snapshots()
        .map((QuerySnapshot query) {
      List<Video> retvalue = [];
      for (var element in query.docs) {
        retvalue.add(Video.fromSnap(element));
      }
      return retvalue;
    }));
  }

  likedVideo(String id) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection("videos").doc(id).get();
    var uid = AuthController.instance.user.uid;
    if ((snapshot.data() as dynamic)['likes'].contains(uid)) {
      await FirebaseFirestore.instance.collection("videos").doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await FirebaseFirestore.instance.collection("videos").doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }
}
