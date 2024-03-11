import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  String profilePhotourl;
   ProfileButton({super.key, required this.profilePhotourl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Stack(
        children: [
          Positioned(
              child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image(
                  image: NetworkImage(
                      profilePhotourl),
                  fit: BoxFit.cover,
                )),
          ))
        ],
      ),
    );
  }
}
