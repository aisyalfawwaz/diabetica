import 'package:diabetica/widgets/StatusDetectionContent.dart';
import 'package:flutter/material.dart';
import 'package:diabetica/models/DataPoint.dart';

class DiabeticaCareCard extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;
  final List<DataPoint> glucoseData;

  const DiabeticaCareCard({super.key, 
    required this.currentIndex,
    required this.onTabChanged,
    required this.glucoseData,
  });

  @override
  _DiabeticaCareCardState createState() => _DiabeticaCareCardState();
}

class _DiabeticaCareCardState extends State<DiabeticaCareCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 1.0,
      child: Column(
        children: [
          _buildSectionTitle('Diabetica Care', Icons.medical_information),
          _buildTabBar(),
          if (widget.currentIndex == 0) _buildAIDetectionContent(),
          if (widget.currentIndex == 1) _buildRecommendationDetectionContent(),
          if (widget.currentIndex == 2)
            StatusDetectionContent(
              statusFeatures: [
                StatusFeature(
                  name: "Diabetes",
                  unit: "mg/dL",
                  icon: Icons.favorite,
                  cardColor: Colors.red,
                  value: "120",
                ),
                StatusFeature(
                  name: "Blood Pressure",
                  unit: "mmHg",
                  icon: Icons.waves,
                  cardColor: Colors.blue,
                  value: "120/80",
                ),
                StatusFeature(
                  name: "Cholesterol",
                  unit: "mg/dL",
                  icon: Icons.opacity,
                  cardColor: Colors.green,
                  value: "150",
                ),
                StatusFeature(
                  name: "BMI",
                  unit: "",
                  icon: Icons.accessibility,
                  cardColor: Colors.orange,
                  value: "22.5",
                ),
                // Add more StatusFeature instances as needed
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.blue,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem('AI Detection', 0),
          _buildTabItem('Recommendation', 1),
          _buildTabItem('Status', 2),
        ],
      ),
    );
  }

  Widget _buildTabItem(String text, int index) {
    return GestureDetector(
      onTap: () {
        widget.onTabChanged(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color:
              widget.currentIndex == index ? Colors.blue : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: widget.currentIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAIDetectionContent() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildAIFeatureItem('Ketoasidosis', 'Deteksi Ketoasis',
              Icons.local_hospital, const Color.fromARGB(255, 253, 182, 110)),
          _buildAIFeatureItem('Neuropati', 'Deteksi Neuropati',
              Icons.accessibility, const Color.fromARGB(255, 110, 204, 41)),
          _buildAIFeatureItem('Retinopati', 'Deteksi Retinopati',
              Icons.remove_red_eye, const Color.fromARGB(255, 41, 110, 204)),
        ],
      ),
    );
  }

  Widget _buildRecommendationDetectionContent() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildRecommendationFeatureItem(
            'Food & Nutrition',
            'Rekomendasi Gizi',
            Icons.restaurant,
            const Color.fromARGB(255, 110, 222, 253),
          ),
          _buildRecommendationFeatureItem(
            'Exercise',
            'Olahraga sesuai',
            Icons.directions_run,
            const Color.fromARGB(255, 204, 177, 41),
          ),
          _buildRecommendationFeatureItem(
            'Other Therapy',
            'Terapi Lain',
            Icons.healing,
            const Color.fromARGB(255, 41, 110, 204),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDetectionContent() {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildStatusFeatureItem(
            'Heart Rate',
            'BPM',
            Icons.favorite,
            const Color.fromARGB(255, 41, 110, 204),
            '78', // Replace with actual heart rate value
          ),
          _buildStatusFeatureItem(
            'Diabetes Risk',
            '%',
            Icons.calculate,
            const Color.fromARGB(255, 110, 222, 253),
            '35', // Replace with actual diabetes risk value
          ),
          _buildStatusFeatureItem(
            'Exercise',
            'Steps',
            Icons.directions_run,
            const Color.fromARGB(255, 253, 182, 110),
            '12000', // Replace with actual step count
          ),
          // Add more status features as needed
        ],
      ),
    );
  }

  Widget _buildAIFeatureItem(
      String feature, String description, IconData icon, Color cardColor) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8.0),
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Meletakkan konten ke kiri
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Meletakkan ikon ke kiri
                children: [
                  Icon(
                    icon,
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Text(
                feature,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
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

  Widget _buildRecommendationFeatureItem(
      String feature, String description, IconData icon, Color cardColor) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8.0),
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Meletakkan konten ke kiri
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // Meletakkan ikon ke kiri
                children: [
                  Icon(
                    icon,
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Text(
                feature,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
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

  Widget _buildStatusFeatureItem(String feature, String unit, IconData icon,
      Color cardColor, String value) {
    return Container(
      width: 150,
      margin: const EdgeInsets.all(8.0),
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: const AlwaysStoppedAnimation(45 / 360),
                      child: Icon(
                        icon,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                feature,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                unit,
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
