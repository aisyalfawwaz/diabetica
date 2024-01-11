import 'package:flutter/material.dart';

class DiabeticaCareWidget extends StatefulWidget {
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
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
            ),
            // Diabetica Care Feature
            DiabeticaCareFeature(),
            // Menu Detection
            DiabeticaMenu(title: 'Detection', icon: Icons.search),
            // Menu Complication
            DiabeticaMenu(title: 'Complication', icon: Icons.warning),
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
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        showBottomSheet = true;
      });
    });
  }
}

class DiabeticaCareFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
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

  DiabeticaMenu({required this.title, required this.icon});

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
        margin: EdgeInsets.all(16),
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
