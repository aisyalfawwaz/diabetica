import 'package:diabetica/models/Medicine.dart';
import 'package:diabetica/widgets/MedicineListWidget.dart';
import 'package:flutter/material.dart';
import 'package:diabetica/models/dummydata.dart';

class MedicineListPage extends StatefulWidget {
  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  final List<Medicine> medicines = dummyMedicines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine List'),
      ),
      body: MedicineListWidget(medicines: medicines),
      // other properties...
    );
  }
}
