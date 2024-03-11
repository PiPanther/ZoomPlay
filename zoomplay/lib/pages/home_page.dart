import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:zoomplay/components/add_icons.dart';
import 'package:zoomplay/components/constants/constants.dart';
import 'package:zoomplay/components/my_drawer.dart';
import 'package:zoomplay/pages/screens/addVideo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: LottieBuilder.asset('lib/assets/logo.json'),
          onPressed: () {
            if (scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.closeDrawer();
            } else {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        backgroundColor: Colors.black87,
        title: Text(
          "Zoom Play",
          style: GoogleFonts.roboto(color: Colors.white),
        ),
      ),
      drawer: const MyDrawer(),
      body: listOfPages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black87,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white54,
          enableFeedback: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: "Search"),
            // BottomNavigationBarItem(, label: "Home"),
            BottomNavigationBarItem(icon: AddIcon(), label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: "Messages"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_4), label: "Profile"),
          ]),
    );
  }
}
