import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// class CustomAddIcon extends StatelessWidget {
  // const CustomAddIcon({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 30,
  //     width: 45,
  //     child: Stack(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.only(left: 10),
  //           width: 38,
  //           decoration: BoxDecoration(
  //               color: Colors.red, borderRadius: BorderRadius.circular(12)),
  //         ),
  //         Center(
  //           child: Container(
  //             height: double.infinity,
  //             width: 38,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //             child: const Icon(
  //               Icons.add,
  //               color: Colors.black,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
// }


Widget AddIcon() {
  return  SizedBox(
      height: 30,
      width: 45,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 38,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(12)),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
}