import 'package:flutter/material.dart';
import 'package:diabetica/services/ApiService.dart';
import 'package:diabetica/widgets/CustomBottomBar.dart';

class UserMedicalFormCombined extends StatefulWidget {
  final String uid;
  UserMedicalFormCombined({required this.uid});
  @override
  _UserMedicalFormCombinedState createState() =>
      _UserMedicalFormCombinedState();
}

class _UserMedicalFormCombinedState extends State<UserMedicalFormCombined> {
  bool? _selectedGender; // Updated to boolean
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  bool _smoke = false;
  bool _familyHistory = false;
  final TextEditingController _hba1cController = TextEditingController();
  final TextEditingController _glucoseController = TextEditingController();
  final TextEditingController _ketonController = TextEditingController();

  // Getter untuk mendapatkan data personal
  Map<String, dynamic> get personalData {
    return {
      'fullName': _fullNameController.text,
      'gender': _selectedGender ?? false, // Adjusted to boolean
      'age': _ageController.text,
      'weight': _weightController.text,
      'height': _heightController.text,
    };
  }

  // Getter untuk mendapatkan data kesehatan
  Map<String, dynamic> get healthData {
    return {
      'smoke': _smoke,
      'familyHistory': _familyHistory,
      'hba1c': _hba1cController.text,
      'glucose': _glucoseController.text,
      'keton': _ketonController.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Personal Information Form
            _buildFormContainer(
              title: 'Personal Information',
              children: [
                _buildInputField('Full Name',
                    controller: _fullNameController, icon: Icons.person),
                SizedBox(height: 16),
                _buildGenderSelection(),
                SizedBox(height: 16),
                _buildInputField('Age',
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    icon: Icons.calendar_today),
                SizedBox(height: 16),
                _buildInputField('Weight (kg)',
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    icon: Icons.line_weight),
                SizedBox(height: 16),
                _buildInputField('Height (cm)',
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    icon: Icons.height),
                SizedBox(height: 24),
              ],
            ),

            // Health Information Form
            _buildFormContainer(
              title: 'Health Information',
              children: [
                _buildRadioGroup(
                  'Do you smoke?',
                  ['Yes', 'No'],
                  _smoke ? 'Yes' : 'No',
                  Icons.smoking_rooms,
                ),
                SizedBox(height: 16),
                _buildRadioGroup(
                  'Family History of Diabetes',
                  ['Yes', 'No'],
                  _familyHistory ? 'Yes' : 'No',
                  Icons.history_edu,
                ),
                SizedBox(height: 16),
                _buildInputField('HbA1c',
                    controller: _hba1cController,
                    keyboardType: TextInputType.number,
                    icon: Icons.assignment),
                SizedBox(height: 16),
                _buildInputField('Glucose',
                    controller: _glucoseController,
                    keyboardType: TextInputType.number,
                    icon: Icons.favorite),
                SizedBox(height: 16),
                _buildInputField('Keton',
                    controller: _ketonController,
                    keyboardType: TextInputType.number,
                    icon: Icons.opacity),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () async {
                    // Save health information
                    Map<String, dynamic> healthData = this.healthData;

                    // Fetch user data from Personal Information
                    Map<String, dynamic> userData = this.personalData;

                    // Use ApiService to post data to the API
                    await ApiService.postMedicalData(
                      userData: {
                        ...userData,
                        'userid': widget.uid, // Pass UID here
                      },
                      healthData: healthData,
                    );

                    // Navigate or handle the result based on your needs
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CustomBottomBar(),
                      ),
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
                    height: 60,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormContainer(
      {required String title, required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInputField(String labelText,
      {TextInputType? keyboardType,
      IconData? icon,
      TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
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
          value: option == 'Yes', // Assuming 'Yes' means true for boolean
          groupValue: label == 'Do you smoke?' ? _smoke : _familyHistory,
          onChanged: (bool? selected) {
            setState(() {
              if (label == 'Do you smoke?') {
                _smoke = selected ?? false;
              } else {
                _familyHistory = selected ?? false;
              }
            });
          },
        ),
        Text(option),
        SizedBox(width: 16),
      ],
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
            _buildGenderRadioButton('Man', Icons.male, true),
            SizedBox(width: 16),
            _buildGenderRadioButton('Woman', Icons.female, false),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderRadioButton(String label, IconData icon, bool value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedGender,
          onChanged: (bool? selected) {
            setState(() {
              _selectedGender = selected ?? false;
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
