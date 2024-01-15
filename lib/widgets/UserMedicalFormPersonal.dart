import 'package:flutter/material.dart';

class UserMedicalFormPersonal extends StatefulWidget {
  final VoidCallback onNextPressed; // Change the type to VoidCallback

  UserMedicalFormPersonal({required this.onNextPressed});

  @override
  _UserMedicalFormPersonalState createState() =>
      _UserMedicalFormPersonalState();
}

class _UserMedicalFormPersonalState extends State<UserMedicalFormPersonal> {
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
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
            'Personal Information',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16),
          _buildInputField('Full Name', icon: Icons.person),
          SizedBox(height: 16),
          _buildGenderSelection(),
          SizedBox(height: 16),
          _buildInputField('Age',
              keyboardType: TextInputType.number, icon: Icons.calendar_today),
          SizedBox(height: 16),
          _buildInputField('Weight (kg)',
              keyboardType: TextInputType.number, icon: Icons.line_weight),
          SizedBox(height: 16),
          _buildInputField('Height (cm)',
              keyboardType: TextInputType.number, icon: Icons.height),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 400,
              height: 60,
              child: ElevatedButton(
                onPressed: widget.onNextPressed,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _buildGenderRadioButton('Man', Icons.male, 'man'),
            SizedBox(width: 16),
            _buildGenderRadioButton('Woman', Icons.female, 'woman'),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderRadioButton(String label, IconData icon, String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedGender,
          onChanged: (String? selected) {
            setState(() {
              _selectedGender = selected!;
            });
          },
        ),
        Icon(icon, color: Colors.blue),
        SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}
