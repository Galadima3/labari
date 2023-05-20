import 'package:flutter/material.dart';

//This button is shared across the auth feature
class SharedButton extends StatelessWidget {
  final String buttonText;
  const SharedButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: const Color(0xFF427dde),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
