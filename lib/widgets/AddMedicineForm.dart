import 'package:diabetica/database/LocalStorage.dart';
import 'package:diabetica/services/ApiService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMedicineForm extends StatelessWidget {
  String selectedMedicineType;
  final TextEditingController dosageController;
  final TextEditingController timeController;
  final DateTime selectedDateTime;
  final Function(BuildContext) selectDateTime;
  final TextEditingController medicineNameController;
  final Function(String) onMedicineTypeChanged; // Callback function

  AddMedicineForm({
    Key? key,
    required this.selectedMedicineType,
    required this.dosageController,
    required this.timeController,
    required this.selectedDateTime,
    required this.selectDateTime,
    required this.medicineNameController,
    required this.onMedicineTypeChanged, // Pass the callback function
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Medicine',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: medicineNameController,
                  decoration: InputDecoration(
                    labelText: 'Medicine Name',
                    icon: Icon(Icons.medical_services, color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Medicine Type',
                    icon: Icon(Icons.category, color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  value: selectedMedicineType,
                  items: ['Oral', 'Injection']
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          ))
                      .toList(),
                  onChanged: (value) {
                    // Update the selectedMedicineType when the user changes the medicine type
                    if (value != null) {
                      onMedicineTypeChanged(value);
                      setState(() {}); // Trigger a rebuild
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: dosageController,
                  decoration: InputDecoration(
                    labelText:
                        'Dosage (${selectedMedicineType == 'Oral' ? 'mg' : 'ml'})',
                    icon: Icon(Icons.format_list_numbered, color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: timeController,
                  decoration: InputDecoration(
                    labelText: 'Time',
                    icon: Icon(Icons.access_time, color: Colors.blue),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  readOnly: true,
                  onTap: () => selectDateTime(context),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    // Get the current user ID from FirebaseAuth
                    String? userId = FirebaseAuth.instance.currentUser?.uid;

                    if (userId != null) {
                      String formattedDateTime =
                          DateFormat("yyyy-MM-ddTHH:mm:ss'Z'")
                              .format(selectedDateTime.toUtc());

                      // Prepare medicine data for API
                      List<Map<String, dynamic>> medicineData = [
                        {
                          'userid': userId,
                          'medicalName': medicineNameController.text,
                          'medicineType': selectedMedicineType,
                          'dosage': dosageController.text,
                          'time': formattedDateTime,
                        }
                      ];

                      // Call the API service to post medicine data
                      ApiService.postMedicineData(medicineData);
                    } else {
                      // Handle the case where the user is not logged in
                      print('User is not logged in');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Add logic for additional action 1
                      },
                      icon:
                          Icon(Icons.add_circle, color: Colors.green, size: 40),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add logic for additional action 2
                      },
                      icon: Icon(Icons.delete, color: Colors.red, size: 40),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
