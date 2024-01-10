import 'package:diabetica/models/Medicine.dart';

List<Medicine> dummyMedicines = [
  Medicine(
    name: 'Medicine A',
    type: 'Type A',
    dosage: '10mg',
    time: '08:00 AM', // Tambahkan waktu untuk Medicine A
    isNotificationOn: false,
  ),
  Medicine(
    name: 'Medicine B',
    type: 'Type B',
    dosage: '20mg',
    time: '12:00 PM', // Tambahkan waktu untuk Medicine B
    isNotificationOn: true,
  ),
  Medicine(
    name: 'Medicine C',
    type: 'Type C',
    dosage: '15mg',
    time: '06:00 PM', // Tambahkan waktu untuk Medicine C
    isNotificationOn: false,
  ),
  Medicine(
    name: 'Medicine D',
    type: 'Type A',
    dosage: '25mg',
    time: '09:30 AM', // Tambahkan waktu untuk Medicine D
    isNotificationOn: true,
  ),
  Medicine(
    name: 'Medicine E',
    type: 'Type B',
    dosage: '30mg',
    time: '03:30 PM', // Tambahkan waktu untuk Medicine E
    isNotificationOn: true,
  ),
  Medicine(
    name: 'Medicine F',
    type: 'Type C',
    dosage: '18mg',
    time: '07:45 AM', // Tambahkan waktu untuk Medicine F
    isNotificationOn: false,
  ),
  // Tambahkan lebih banyak data dummy jika diperlukan
];
