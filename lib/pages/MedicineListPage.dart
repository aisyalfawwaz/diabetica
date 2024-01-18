import 'package:diabetica/models/Medicine.dart';
import 'package:diabetica/widgets/MedicineListWidget.dart';
import 'package:flutter/material.dart';
import 'package:diabetica/models/dummydata.dart';

class MedicineListPage extends StatefulWidget {
  const MedicineListPage({super.key});

  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine List'),
      ),
      body: MedicineListWidget(),
      // other properties...
    );
  }
}
