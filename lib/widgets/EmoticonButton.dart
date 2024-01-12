import 'package:flutter/material.dart';

class EmoticonButton extends StatelessWidget {
  final IconData icon;
  final Color buttonColor;
  final Color iconColor;
  final double iconSize;

  const EmoticonButton({
    Key? key,
    required this.icon,
    this.buttonColor = Colors.blue, // Warna latar belakang button
    this.iconColor = Colors.white, // Warna ikon
    this.iconSize = 36.0, // Ukuran ikon default
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(icon, size: iconSize),
        color: iconColor,
        onPressed: () {
          // Tambahkan aksi yang diinginkan di sini
        },
      ),
    );
  }
}
