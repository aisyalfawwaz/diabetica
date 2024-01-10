import 'package:flutter/material.dart';
import 'dart:math' as math;

class DataFetchingWidget extends StatefulWidget {
  final bool isFetching;
  final VoidCallback onPressed;

  DataFetchingWidget({required this.isFetching, required this.onPressed});

  @override
  _DataFetchingWidgetState createState() => _DataFetchingWidgetState();
}

class _DataFetchingWidgetState extends State<DataFetchingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTapDown: (_) {
              setState(() {
                _isButtonPressed = true;
              });
            },
            onTapUp: (_) {
              setState(() {
                _isButtonPressed = false;
              });
            },
            onTapCancel: () {
              setState(() {
                _isButtonPressed = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 150),
              width: _isButtonPressed ? 150 : 120,
              height: _isButtonPressed ? 150 : 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: _isButtonPressed
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: _isButtonPressed
                    ? RotationTransition(
                        turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                        child: Icon(
                          Icons.refresh,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    : Text(
                        'Fetch Data',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ),

          SizedBox(height: 20),
          if (widget.isFetching)
            CircularProgressIndicator() // Animasi fetching data
          else
            SizedBox.shrink(), // Jika tidak fetching, tampilkan widget kosong
        ],
      ),
    );
  }
}
