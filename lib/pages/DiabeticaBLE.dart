// import 'package:diabetica/services/Permission.dart';
// import 'package:diabetica/widgets/DeviceList.dart';
// import 'package:flutter/material.dart';

// class BleScannerPage extends StatefulWidget {
//   const BleScannerPage({super.key});

//   @override
//   _BleScannerPageState createState() => _BleScannerPageState();
// }

// class _BleScannerPageState extends State<BleScannerPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BLE Scanner'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const PermissionsPage()),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child: const Text('Start Scanning'),
//             ),
//             const SizedBox(height: 20),
//             const Text(
//               'Discovered Devices:',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 10),
//             const DeviceList(),
//           ],
//         ),
//       ),
//     );
//   }
// }
