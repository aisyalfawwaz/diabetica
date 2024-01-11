import 'package:flutter/material.dart';

class EmoticonButton extends StatelessWidget {
  final IconData icon;

  EmoticonButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () {
        // Handle emoticon button pressed
      },
    );
  }
}
