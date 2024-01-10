import 'package:flutter/material.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  int _currentPage = 0;
  final int _totalPages = 3; // Ganti dengan jumlah total halaman boarding

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              // Implementasikan navigasi ke halaman lain di sini
              // Misalnya: Navigator.pushNamed(context, '/other_page');
            },
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade200,
              Colors.blue.shade600,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Halaman Boarding $_currentPage',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _totalPages,
                (index) => _buildDotIndicator(index),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildNavigationButton(
                  Icons.arrow_back_ios,
                  _currentPage > 0,
                ),
                SizedBox(width: 20),
                _buildNavigationButton(
                  Icons.arrow_forward_ios,
                  _currentPage < _totalPages - 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDotIndicator(int index) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.white : Colors.grey,
      ),
    );
  }

  Widget _buildNavigationButton(IconData icon, bool isEnabled) {
    return Material(
      elevation: isEnabled ? 4.0 : 0.0,
      borderRadius: BorderRadius.circular(25),
      color: isEnabled ? Colors.white : Colors.transparent,
      child: InkWell(
        onTap: isEnabled
            ? () {
                setState(() {
                  if (icon == Icons.arrow_back_ios && _currentPage > 0) {
                    _currentPage--;
                  } else if (icon == Icons.arrow_forward_ios &&
                      _currentPage < _totalPages - 1) {
                    _currentPage++;
                  }
                });
              }
            : null,
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Icon(
              icon,
              size: 30,
              color: isEnabled ? Colors.blue : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
