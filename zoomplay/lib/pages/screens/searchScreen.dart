import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zoomplay/models/user_model.dart';
import 'package:zoomplay/pages/screens/profile_screen.dart';
class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
TextEditingController searchQuery = TextEditingController();

SearchController searchController = Get.find<SearchController>();

  
  @override
  Widget build(BuildContext context) {
    // List<MyUser> users = searchController
    return Obx(() {
        return Scaffold(
          appBar: AppBar(

            title: TextFormField(
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                    hintText: "Search Username"
                )
            ,controller: searchQuery , onFieldSubmitted: (value){
              
            },),


          ),
          body:   ?   Center(
            child: Text("Search Users!"),
          ) :
          ListView.builder(
              itemCount: searchController..length,
              itemBuilder: (context, index){
            MyUser user = searchController.[index];

            return ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen(uid: user.uid)));
              },
              leading: CircleAvatar(
                backgroundImage: NetworkImage(

                  user.profilePhoto
                ),
              ),

              title: Text(user.name),

            );
          })
          ,
        );
      }
    );
  }
}