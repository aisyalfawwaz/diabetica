// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:diabetica/models/medicine.dart';

// class LocalStorage {
//   static late Box<dynamic> _medicineBox;

//   static Future<void> initialize() async {
//     await Hive.initFlutter();
//     Hive.registerAdapter(MedicineAdapter());
//     _medicineBox = await Hive.openBox('medicineBox');
//   }

//   static Future<void> saveMedicine(Medicine medicine) async {
//     await _medicineBox.put(medicine.id, medicine);
//   }

//   static List<Medicine> getMedicineList() {
//     return _medicineBox.values.map((dynamic e) => e as Medicine).toList();
//   }

//   static Future<void> deleteAllMedicine() async {
//     await _medicineBox.clear();
//   }
// }
