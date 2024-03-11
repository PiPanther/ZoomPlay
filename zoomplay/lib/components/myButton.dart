import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.onTap});
  String text;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
    );
  }
}
