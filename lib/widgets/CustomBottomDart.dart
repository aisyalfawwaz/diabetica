import 'package:diabetica/pages/ConsultationPage.dart';
import 'package:diabetica/pages/HistoryPage.dart';
import 'package:diabetica/pages/HomePage.dart';
import 'package:diabetica/pages/MedicineListPage.dart';
import 'package:diabetica/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar>
    with AutomaticKeepAliveClientMixin {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Ensure that super.build is called

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          HomePage(), // Ganti dengan widget HomePage
          HistoryPage(), // Ganti dengan widget HistoryPage
          // UserDataForm(),
          ConsultationPage(),
          // DataFetchingPage(),
          MedicineListPage(),
          // FeaturePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: PhysicalModel(
        color: Colors.white,
        elevation: 8.0,
        shadowColor: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: SalomonBottomBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.history_edu),
                title: Text('History'),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.add),
                title: Text('Add'),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.featured_play_list),
                title: Text('Feature'),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
                selectedColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
