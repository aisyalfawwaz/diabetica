import 'package:flutter/material.dart';

class AddMedicineForm extends StatelessWidget {
  final String selectedMedicineType;
  final TextEditingController dosageController;
  final TextEditingController timeController;
  final DateTime selectedDateTime;
  final Function(BuildContext) selectDateTime;

  const AddMedicineForm({
    required this.selectedMedicineType,
    required this.dosageController,
    required this.timeController,
    required this.selectedDateTime,
    required this.selectDateTime,
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
        child: Column(
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
              // Add logic to handle the medicine name input
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
                // Add logic to handle medicine type change
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
              // Add logic to handle the dosage input
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
              onPressed: () {
                // Add logic to save medicine details
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Warna latar tombol
                onPrimary: Colors.white, // Warna teks tombol
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
                  icon: Icon(Icons.add_circle, color: Colors.green, size: 40),
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
        ),
      ),
    );
  }
}
