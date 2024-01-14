import 'package:flutter/material.dart';

class DiabeticaOnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const DiabeticaOnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              imagePath,
              height: 300,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}

class DiabeticaOnboarding extends StatefulWidget {
  const DiabeticaOnboarding({super.key});

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
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingData = [
      {
        'title': 'Welcome to Diabetica',
        'description':
            'Your personal health assistant for managing diabetes and improving your lifestyle.',
        'imagePath': 'assets/images/onboarding1.png',
      },
      {
        'title': 'Monitor Your Health',
        'description':
            'Track your blood sugar levels, daily activities, and manage your diet effortlessly.',
        'imagePath': 'assets/images/onboarding2.png',
      },
      {
        'title': 'Personalized Insights',
        'description':
            'Receive personalized recommendations and insights for a healthier life.',
        'imagePath': 'assets/images/onboarding3.png',
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
            imagePath: data['imagePath']!,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          if (_currentPage < onboardingData.length - 1) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            // Navigate to the next screen or perform necessary actions
            // after completing the onboarding process.
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0), // Atur margin start di sini
              child: InkWell(
                onTap: () {
                  // Action when 'Skip' is pressed
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    decoration: TextDecoration.underline,
                  ),
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
                      color: _currentPage == index
                          ? Colors.blue
                          : Colors.grey[400],
                    ),
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
