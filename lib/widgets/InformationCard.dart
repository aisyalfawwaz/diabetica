import 'package:flutter/material.dart';

class InformationCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const InformationCard({super.key, 
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  _InformationCardState createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color.fromARGB(255, 232, 227, 227)
                        .withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: InkWell(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    widget.icon,
                    size: 36,
                    color: _isHovered ? Colors.blue : Colors.black,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.description),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
