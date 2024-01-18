import 'package:diabetica/pages/AddMedicinePage.dart';
import 'package:flutter/material.dart';
import 'package:diabetica/models/Medicine.dart';
import 'package:http/http.dart' as http;
import 'package:diabetica/services/ApiService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MedicineListWidget extends StatefulWidget {
  @override
  _MedicineListWidgetState createState() => _MedicineListWidgetState();
}

class _MedicineListWidgetState extends State<MedicineListWidget> {
  List<Medicine> medicines = [];

  @override
  void initState() {
    super.initState();
    // Fetch medicine data when the widget initializes
    _fetchMedicineData();
  }

  Future<void> _fetchMedicineData() async {
    try {
      // Get the current user from FirebaseAuth
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid;
        List<Medicine> fetchedMedicines =
            await ApiService.fetchMedicineData(userId);

        setState(() {
          medicines = fetchedMedicines;
        });
      } else {
        // Handle the case where the user is not logged in
        print('User is not logged in');
      }
    } catch (e) {
      print('Error fetching medicine data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: medicines.isEmpty
          ? const Center(
              child: Text('No schedule data'),
            )
          : ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (context, index) {
                final medicine = medicines[index];
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  onDismissed: (direction) {
                    // Pass the user ID and medicine ID to delete method
                    ApiService.deleteMedicine(medicine.userId, medicine.id);
                    _fetchMedicineData(); // Refresh the medicine list after deletion
                  },
                  child: ListTile(
                    title: Text(medicine.medicalName),
                    subtitle:
                        Text('${medicine.medicineType} - ${medicine.dosage}'),
                    leading: _getMedicineIcon(medicine.medicineType),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Pass the user ID and medicine ID to delete method
                        ApiService.deleteMedicine(medicine.userId, medicine.id);
                        _fetchMedicineData(); // Refresh the medicine list after deletion
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicinePage()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getMedicineIcon(String type) {
    IconData icon;
    Color iconColor;

    switch (type) {
      case 'Oral':
        icon = Icons.local_hospital;
        iconColor = Colors.red;
        break;
      case 'Injection':
        icon = Icons.healing;
        iconColor = Colors.green;
        break;
      default:
        icon = Icons.medical_services;
        iconColor = Colors.blue;
        break;
    }

    return Icon(
      icon,
      color: iconColor,
    );
  }
}
