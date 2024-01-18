import 'package:diabetica/widgets/AddMedicineForm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMedicinePage extends StatefulWidget {
  const AddMedicinePage({Key? key}) : super(key: key);

  @override
  _AddMedicinePageState createState() => _AddMedicinePageState();
}

class _AddMedicinePageState extends State<AddMedicinePage> {
  String _selectedMedicineType = 'Oral';
  TextEditingController _dosageController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _medicineNameController =
      TextEditingController(); // Add this line
  DateTime _selectedDateTime = DateTime.now();

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();

    // Show Date Picker
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      // Date is selected, now show Time Picker
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: selectedTime,
      );

      if (pickedTime != null) {
        // Time is selected
        selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        // Update the selectedDateTime and timeController
        setState(() {
          _selectedDateTime = selectedDate;
          _timeController.text =
              DateFormat.yMd().add_Hms().format(selectedDate);
        });
      }
    }
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
          medicineNameController: _medicineNameController,
          onMedicineTypeChanged: (newMedicineType) {
            setState(() {
              _selectedMedicineType = newMedicineType;
            });
          },
        ),
      ),
    );
  }
}
