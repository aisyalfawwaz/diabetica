import 'package:flutter/material.dart';

class QuickAccessButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const QuickAccessButton({super.key, 
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  _QuickAccessButtonState createState() => _QuickAccessButtonState();
}

class _QuickAccessButtonState extends State<QuickAccessButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Column(
        children: [
          Icon(
            widget.icon,
            size: 40,
            color: _isTapped ? Colors.blue.withOpacity(0.5) : Colors.black,
          ),
          const SizedBox(height: 8),
          Text(widget.label),
        ],
      ),
    );
  }
}

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
      child: Card(
        elevation: _isHovered ? 8.0 : 4.0,
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
    );
  }
}
