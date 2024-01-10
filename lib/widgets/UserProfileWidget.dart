// ignore_for_file: file_names, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class UserProfileWidget extends StatefulWidget {
  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.6).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30), // Menambahkan margin top
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png',
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Diabetica', // Mengganti teks 'John Doe' menjadi 'Diabetica'
              style: TextStyle(
                fontSize: 35,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center, // Agar teks di-center
            ),
          ),
          IconButton(
            icon: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: child,
                );
              },
              child: const Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
            onPressed: () {
              _controller.forward(from: 0.0); // Memulai animasi
              // Aksi saat icon notifikasi ditekan
            },
          ),
        ],
      ),
    );
  }
}
