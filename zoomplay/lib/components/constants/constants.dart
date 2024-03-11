import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoomplay/pages/screens/addVideo.dart';
import 'package:zoomplay/pages/screens/home_page_reels.dart';
import 'package:zoomplay/pages/screens/profile_screen.dart';
import 'package:zoomplay/pages/screens/searchScreen.dart';

List<Widget> listOfPages = [
  HomePageReels(),
  SearchScreen(),
  AddVideo(),
  Text("Messages"),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
