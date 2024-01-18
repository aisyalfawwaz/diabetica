import 'package:diabetica/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiabeticaOnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  // final String imagePath;
  final Color bacgroundColor;

  const DiabeticaOnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    // required this.imagePath,
    required this.bacgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Image.asset(
            //   imagePath,
            //   height: 300,
            //   width: 300,
            // ),
          ],
        ),
      ),
    );
  }
}

class DiabeticaOnboarding extends StatefulWidget {
  const DiabeticaOnboarding({Key? key}) : super(key: key);

  @override
  _DiabeticaOnboardingState createState() => _DiabeticaOnboardingState();
}

class _DiabeticaOnboardingState extends State<DiabeticaOnboarding> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
    );

    // Check if onboarding has been completed before
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;

    if (onboardingCompleted) {
      // If onboarding has been completed, navigate to the login page
      _navigateToLogin();
    }
  }

  Future<void> _setOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingCompleted', true);
  }

  void _navigateToLogin() {
    // Navigate to the login page or home page as needed
    // (You can replace 'LoginPage' with your actual login screen class)
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingData = [
      {
        'title': 'Welcome to Diabetica',
        'description':
            'Your personal health assistant for managing diabetes and improving your lifestyle.',
        // 'imagePath': 'assets/images/onboarding1.png',
      },
      {
        'title': 'Monitor Your Health',
        'description':
            'Track your blood sugar levels, daily activities, and manage your diet effortlessly.',
        // 'imagePath': 'assets/images/onboarding2.png',
      },
      {
        'title': 'Personalized Insights',
        'description':
            'Receive personalized recommendations and insights for a healthier life.',
        // 'imagePath': 'assets/images/onboarding3.png',
      },
    ];

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final data = onboardingData[index];
          return DiabeticaOnboardingPage(
            title: data['title']!,
            description: data['description']!,
            // imagePath: data['imagePath']!,
            bacgroundColor: Colors.blue,
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (_currentPage != 0)
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                _pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(Icons.arrow_back, color: Colors.blue),
            ),
          const SizedBox(width: 100),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              if (_currentPage < onboardingData.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                // Onboarding is completed, navigate to the next screen or perform necessary actions
                _setOnboardingStatus();
                _navigateToLogin();
              }
            },
            child: _currentPage == onboardingData.length - 1
                ? const Icon(Icons.check, color: Colors.blue)
                : const Icon(Icons.arrow_forward, color: Colors.blue),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0), // Adjust the start margin here
              child: InkWell(
                onTap: () {
                  // Action when 'Skip' is pressed
                  _setOnboardingStatus();
                  _navigateToLogin();
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: List.generate(
                onboardingData.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentPage == index ? Colors.grey : Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
