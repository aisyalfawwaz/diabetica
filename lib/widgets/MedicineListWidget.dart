import 'package:diabetica/pages/AddMedicinePage.dart';
import 'package:flutter/material.dart';
import 'package:diabetica/models/Medicine.dart';

class MedicineListWidget extends StatefulWidget {
  final List<Medicine> medicines;

  const MedicineListWidget({Key? key, required this.medicines})
      : super(key: key);

  @override
  _MedicineListWidgetState createState() => _MedicineListWidgetState();
}

class _MedicineListWidgetState extends State<MedicineListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.medicines.isEmpty
          ? const Center(
              child: Text('No schedule data'),
            )
          : ListView.builder(
              itemCount: widget.medicines.length,
              itemBuilder: (context, index) {
                final medicine = widget.medicines[index];
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
                    setState(() {
                      // Hapus obat dari daftar
                      widget.medicines.removeAt(index);
                    });
                  },
                  child: ListTile(
                    title: Text(medicine.name),
                    subtitle: Text('${medicine.type} - ${medicine.dosage}'),
                    leading: _getMedicineIcon(medicine.type),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        // Add logic to delete medicine
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

  // Metode untuk mendapatkan ikon obat sesuai jenisnya
  Widget _getMedicineIcon(String type) {
    IconData icon;
    Color iconColor;

    switch (type) {
      case 'Type A':
        icon = Icons.local_hospital;
        iconColor = Colors.red;
        break;
      case 'Type B':
        icon = Icons.healing;
        iconColor = Colors.green;
        break;
      case 'Type C':
        icon = Icons.medical_services;
        iconColor = Colors.blue;
        break;
      default:
        icon = Icons.healing;
        iconColor = Colors.grey;
        break;
    }

    return Icon(
      icon,
      color: iconColor,
    );
  }
}
