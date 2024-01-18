import 'package:diabetica/services/ApiService.dart';
import 'package:flutter/material.dart';

class UserDetailScreen extends StatefulWidget {
  final String userId;

  UserDetailScreen({required this.userId});

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  final ApiService apiService =
      ApiService('https://diabetica-1e76e.et.r.appspot.com');

  late Future<Map<String, dynamic>> userDetail;

  @override
  void initState() {
    super.initState();
    userDetail = ApiService.getUserDetails(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: userDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final userData = snapshot.data?['data'];
            return _buildUserDetail(userData);
          }
        },
      ),
    );
  }

  Widget _buildUserDetail(Map<String, dynamic>? userData) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem('Full Name', userData?['fullname'], Icons.person),
          _buildDetailItem('Age', userData?['age'], Icons.cake),
          _buildDetailItem(
            'Gender',
            userData?['gender'] == true ? 'Male' : 'Female',
            userData?['gender'] == true ? Icons.male : Icons.female,
          ),
          _buildDetailItem(
              'Weight', '${userData?['weight']} kg', Icons.line_weight),
          _buildDetailItem('Height', '${userData?['height']} cm', Icons.height),
          _buildDetailItem(
            'Smoking',
            userData?['smoking'] == true ? 'Yes' : 'No',
            userData?['smoking'] == true
                ? Icons.smoke_free
                : Icons.smoking_rooms,
          ),
          _buildDetailItem(
            'Family Diabetes History',
            userData?['familyhistory'] == true ? 'Yes' : 'No',
            userData?['familyhistory'] == true
                ? Icons.family_restroom
                : Icons.cancel,
          ),
          _buildDetailItem('Body Mass Index (BMI)', userData?['bmi'],
              Icons.accessibility_new),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String? value, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Colors.blue,
                  size: 28,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 4),
                  if (label == 'BMI') ...[
                    Text(
                      value ?? 'N/A',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    _buildBMIStatus(value),
                  ] else ...[
                    Text(
                      value ?? 'N/A',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
          height: 16,
        ),
      ],
    );
  }

  Widget _buildBMIStatus(String? bmiValue) {
    double bmi = double.tryParse(bmiValue ?? '') ?? 0.0;

    String status = 'Unknown';
    Color statusColor = Colors.black;

    if (bmi > 0.0) {
      if (bmi < 18.5) {
        status = 'Underweight';
        statusColor = Colors.blue;
      } else if (bmi >= 18.5 && bmi < 24.9) {
        status = 'Normal';
        statusColor = Colors.green;
      } else if (bmi >= 25.0 && bmi < 29.9) {
        status = 'Overweight';
        statusColor = Colors.yellow;
      } else {
        status = 'Obese';
        statusColor = Colors.red;
      }
    }

    return Text(
      'Status: $status',
      style: TextStyle(
        fontSize: 16,
        color: statusColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
