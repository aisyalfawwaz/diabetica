import 'package:diabetica/pages/BleDiabeticaConnect.dart';
import 'package:diabetica/widgets/CustomBottomBar.dart';
import 'package:flutter/material.dart';

class UserMedicalFormHealth extends StatefulWidget {
  @override
  _UserMedicalFormHealthState createState() => _UserMedicalFormHealthState();
}

class _UserMedicalFormHealthState extends State<UserMedicalFormHealth> {
  String _smoke = '';
  String _exerciseFrequency = '';
  String _familyHistory = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Health Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16),
          _buildRadioGroup(
            'Do you smoke?',
            ['Yes', 'No'],
            _smoke,
            Icons.smoking_rooms,
          ),
          SizedBox(height: 16),
          _buildExerciseFrequencyField(),
          SizedBox(height: 16),
          _buildRadioGroup(
            'Family History of Diabetes',
            ['Yes', 'No'],
            _familyHistory,
            Icons.history_edu,
          ),
          SizedBox(height: 16),
          _buildInputField('HbA1c',
              keyboardType: TextInputType.number, icon: Icons.assignment),
          SizedBox(height: 16),
          _buildInputField('Glucose',
              keyboardType: TextInputType.number, icon: Icons.favorite),
          SizedBox(height: 16),
          _buildInputField('Keton',
              keyboardType: TextInputType.number, icon: Icons.opacity),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Save health information
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CustomBottomBar()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
            ),
            child: Container(
              width: 400,
              height: 60, // Set the height as per your preference
              alignment: Alignment
                  .center, // Adjust the alignment as per your preference
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String labelText,
      {TextInputType? keyboardType, IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
      keyboardType: keyboardType,
    );
  }

  Widget _buildRadioGroup(
      String label, List<String> options, String selected, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: options
              .map((option) => _buildRadioOption(label, option))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildRadioOption(String label, String option) {
    return Row(
      children: [
        Radio(
          value: option,
          groupValue: label == 'Do you smoke?' ? _smoke : _familyHistory,
          onChanged: (String? selected) {
            setState(() {
              if (label == 'Do you smoke?') {
                _smoke = selected!;
              } else {
                _familyHistory = selected!;
              }
            });
          },
        ),
        Text(option),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildExerciseFrequencyField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.directions_run, color: Colors.blue),
            SizedBox(width: 8),
            Text(
              'Exercise Frequency',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _buildRadioOption('Exercise Frequency', 'Light'),
            _buildRadioOption('Exercise Frequency', 'Moderate'),
            _buildRadioOption('Exercise Frequency', 'Intense'),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
