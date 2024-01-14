import 'package:flutter/material.dart';

class StatusDetectionContent extends StatefulWidget {
  final List<StatusFeature> statusFeatures;

  const StatusDetectionContent({
    Key? key,
    required this.statusFeatures,
  }) : super(key: key);

  @override
  _StatusDetectionContentState createState() => _StatusDetectionContentState();
}

class _StatusDetectionContentState extends State<StatusDetectionContent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.statusFeatures.length,
        itemBuilder: (context, index) {
          return _buildStatusFeatureItem(widget.statusFeatures[index]);
        },
      ),
    );
  }

  Widget _buildStatusFeatureItem(StatusFeature feature) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8.0),
      child: Card(
        color: feature.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Center(
                  child: ClipOval(
                    child: Container(
                      width: 40,
                      height: 40,
                      color: feature.cardColor,
                      child: Center(
                        child: Icon(
                          feature.icon,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                feature.name,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                child: Text(
                  feature.value,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                feature.unit,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusFeature {
  final String name;
  final String unit;
  final IconData icon;
  final Color cardColor;
  final String value;

  StatusFeature({
    required this.name,
    required this.unit,
    required this.icon,
    required this.cardColor,
    required this.value,
  });
}
