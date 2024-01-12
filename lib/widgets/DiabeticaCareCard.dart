import 'package:flutter/material.dart';
import 'package:diabetica/widgets/WeeklyGlucoseBarChart.dart';
import 'package:diabetica/widgets/MonthlyGlucoseBarChart.dart';
import 'package:diabetica/widgets/YearlyGlucoseBarChart.dart';
import 'package:diabetica/models/DataPoint.dart';

class DiabeticaCareCard extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabChanged;
  final List<DataPoint> glucoseData;

  const DiabeticaCareCard({
    required this.currentIndex,
    required this.onTabChanged,
    required this.glucoseData,
  });

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
          if (currentIndex == 0) _buildAIDetectionContent(),
          if (currentIndex == 1) _buildRecommendationDetectionContent(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.blue,
          ),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabItem('AI Detection', 0),
          _buildTabItem('Recommendation', 1),
        ],
      ),
    );
  }

  Widget _buildTabItem(String text, int index) {
    return GestureDetector(
      onTap: () {
        onTabChanged(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: currentIndex == index ? Colors.blue : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: currentIndex == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAIDetectionContent() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildAIFeatureItem('Ketoasidosis', 'Deteksi Ketoasis',
              Icons.local_hospital, Color.fromARGB(255, 253, 182, 110)),
          _buildAIFeatureItem('Neuropati', 'Deteksi Neuropati',
              Icons.accessibility, Color.fromARGB(255, 110, 204, 41)),
          _buildAIFeatureItem('Retinopati', 'Deteksi Retinopati',
              Icons.remove_red_eye, Color.fromARGB(255, 41, 110, 204)),
        ],
      ),
    );
  }

  Widget _buildRecommendationDetectionContent() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildAIFeatureItem(
            'Food & Nutrition',
            'Rekomendasi Gizi',
            Icons.restaurant,
            Color.fromARGB(255, 110, 222, 253),
          ),
          _buildAIFeatureItem(
            'Exercise',
            'Olahraga sesuai',
            Icons.directions_run,
            Color.fromARGB(255, 204, 177, 41),
          ),
          _buildAIFeatureItem(
            'Other Therapy',
            'Terapi Lain',
            Icons.healing,
            Color.fromARGB(255, 41, 110, 204),
          ),
        ],
      ),
    );
  }

  Widget _buildAIFeatureItem(
      String feature, String description, IconData icon, Color cardColor) {
    return Container(
      width: 150,
      margin: EdgeInsets.all(8.0),
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
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
              SizedBox(height: 60),
              Text(
                feature,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
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
}
