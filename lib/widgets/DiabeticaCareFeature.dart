import 'package:flutter/material.dart';

class DiabeticaCareWidget extends StatefulWidget {
  const DiabeticaCareWidget({Key? key}) : super(key: key);

  @override
  _DiabeticaCareWidgetState createState() => _DiabeticaCareWidgetState();
}

class _DiabeticaCareWidgetState extends State<DiabeticaCareWidget> {
  bool showBottomSheet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Rounded rectangle for scroll indication
            Container(
              height: 20,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            // Diabetica Care Feature
            const DiabeticaCareFeature(),
            // Menu Detection
            const DiabeticaMenu(title: 'Detection', icon: Icons.search),
            // Menu Complication
            const DiabeticaMenu(title: 'Complication', icon: Icons.warning),
            // Additional features/icons
            DiabeticaFeatureIcons(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        showBottomSheet = true;
      });
    });
  }
}

class DiabeticaCareFeature extends StatelessWidget {
  const DiabeticaCareFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'Diabetica Care Feature',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class DiabeticaMenu extends StatelessWidget {
  final String title;
  final IconData icon;

  const DiabeticaMenu({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle menu tap
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$title Menu Pressed'),
          ),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
      ),
    );
  }
}

class DiabeticaFeatureIcons extends StatelessWidget {
  final List<IconData> icons = [
    Icons.favorite,
    Icons.access_alarm,
    Icons.local_hospital,
    Icons.local_pharmacy,
    Icons.fitness_center,
    Icons.restaurant_menu,
  ];

  DiabeticaFeatureIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        children: icons.map((icon) {
          return GestureDetector(
            onTap: () {
              // Handle feature icon tap
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$icon Feature Pressed'),
                ),
              );
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Icon(icon),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
