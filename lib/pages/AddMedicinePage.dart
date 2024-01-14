import 'package:diabetica/widgets/AddMedicineForm.dart';
import 'package:flutter/material.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  String _selectedMedicineType = 'Oral';
  TextEditingController _dosageController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    // Add logic to select date and time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Medicine'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: AddMedicineForm(
          selectedMedicineType: _selectedMedicineType,
          dosageController: _dosageController,
          timeController: _timeController,
          selectedDateTime: _selectedDateTime,
          selectDateTime: _selectDateTime,
        ),
      ),
    );
  }
}
