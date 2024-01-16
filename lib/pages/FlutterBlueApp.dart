// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// class BleScanConnectExample extends StatefulWidget {
//   @override
//   _BleScanConnectExampleState createState() => _BleScanConnectExampleState();
// }

// class _BleScanConnectExampleState extends State<BleScanConnectExample> {
//   late FlutterBluePlus flutterBlue;
//   StreamSubscription<ScanResult>? scanSubscription;
//   bool isScanning = false;
//   List<BluetoothDevice> scannedDevices = [];

//   @override
//   void initState() {
//     super.initState();
//     startScanning();
//   }

//   void startScanning() async {
//     // Check if Bluetooth is supported
//     if (!(await FlutterBluePlus.isSupported)) {
//       print("Bluetooth not supported by this device");
//       return;
//     }

//     // Check and handle Bluetooth on/off state
//     var subscription =
//         FlutterBluePlus.adapterState.listen((BluetoothAdapterState state) {
//       print(state);
//       if (state == BluetoothAdapterState.on) {
//         // Start or stop scanning when Bluetooth is on
//         setState(() {
//           isScanning = !isScanning;
//         });
//         isScanning
//             ? FlutterBluePlus.startScan(withServices: [])
//             : FlutterBluePlus.stopScan();
//       } else {
//         // Handle Bluetooth off state
//         // You may show an error to the user or take appropriate action
//       }
//     });

//     // Cancel to prevent duplicate listeners
//     subscription.cancel();

//     // Listen to scan results
//     scanSubscription = FlutterBluePlus.onScanResults.listen((results) {
//       for (ScanResult r in results) {
//         print('${r.device.remoteId}: "${r.advertisementData.advName}" found!');
//         // Add the scanned device to the list
//         setState(() {
//           scannedDevices.add(r.device);
//         });
//         // You can connect to the device here if needed
//         connectToDevice(r.device);
//       }
//     }, onError: (e) => print(e)) as StreamSubscription<ScanResult>?;
//   }

//   void connectToDevice(BluetoothDevice device) async {
//     // Connect to the device
//     await device.connect();

//     // Listen for disconnection
//     var connectionSubscription =
//         device.connectionState.listen((BluetoothConnectionState state) async {
//       if (state == BluetoothConnectionState.disconnected) {
//         // Handle disconnection, and possibly reconnect
//         // print(
//         //     "${device.disconnectReasonCode} ${device.disconnectReasonDescription}");
//       }
//     });

//     // Perform operations with the connected device here

//     // Disconnect from the device (uncomment if needed)
//     // await device.disconnect();

//     // Cancel to prevent duplicate listeners
//     connectionSubscription.cancel();
//   }

//   @override
//   void dispose() {
//     // Stop scanning when the widget is disposed
//     FlutterBluePlus.stopScan();
//     scanSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('BLE Scan and Connect Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (isScanning)
//               CircularProgressIndicator()
//             else
//               Text('Scanning for BLE devices...'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: startScanning,
//               child: Text(isScanning ? 'Stop Scanning' : 'Start Scanning'),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: scannedDevices.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(scannedDevices[index].name ?? 'Unknown Device'),
//                     subtitle: Text(scannedDevices[index].remoteId.id),
//                     onTap: () {
//                       // Handle tapping on a device in the list
//                       // You can connect to the device or perform other actions
//                       connectToDevice(scannedDevices[index]);
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() => runApp(MaterialApp(home: BleScanConnectExample()));
