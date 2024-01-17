import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DataFetchingScreen extends StatefulWidget {
  final BluetoothDevice device;

  DataFetchingScreen(this.device);

  @override
  _DataFetchingScreenState createState() => _DataFetchingScreenState();
}

class _DataFetchingScreenState extends State<DataFetchingScreen> {
  String heartRateValue = "N/A"; // Variable to store Heart Rate value

  @override
  void initState() {
    super.initState();
    _connectToDevice(widget.device);
  }

  void _connectToDevice(BluetoothDevice device) async {
    try {
      await device.connect();

      List<BluetoothService> services = await device.discoverServices();
      for (BluetoothService service in services) {
        if (service.uuid == Guid("19B10000-E8F2-537E-4F6C-D104768A1214")) {
          for (BluetoothCharacteristic characteristic
              in service.characteristics) {
            if (characteristic.uuid ==
                Guid("00002A37-0000-1000-8000-00805F9B34FB")) {
              // Enable notifications
              await characteristic.setNotifyValue(true);

              // Listen for value changes
              characteristic.value.listen((value) {
                // Take the value at the first index of the array
                int heartRate = value[0];

                // Update the displayed heart rate value
                setState(() {
                  heartRateValue = heartRate.toString();
                });
              });
            }
          }
        }
      }
    } catch (e) {
      print("Error connecting to device: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
