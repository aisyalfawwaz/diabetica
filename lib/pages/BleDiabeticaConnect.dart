import 'package:diabetica/pages/HeartRateScreen.dart';
import 'package:diabetica/widgets/CustomBottomBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceListScreen extends StatefulWidget {
  @override
  _DeviceListScreenState createState() => _DeviceListScreenState();
}

class _DeviceListScreenState extends State<DeviceListScreen> {
  List<BluetoothDevice> devices = [];
  String heartRateValue = "N/A"; // Menyimpan nilai Heart Rate
  bool isConnected = false;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
    setState(() {
      devices.clear();
      isScanning = true;
    });

    FlutterBluePlus.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (result.device.name == "diabetica" &&
            !devices.contains(result.device)) {
          setState(() {
            devices.add(result.device);
          });
        }
      }
    });

    FlutterBluePlus.startScan(timeout: Duration(seconds: 5)).then((value) {
      setState(() {
        isScanning = false;
      });
    });
  }

  void _goBack() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => CustomBottomBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
        title: Row(
          children: [
            Icon(
              isConnected
                  ? Icons.sentiment_satisfied
                  : Icons.sentiment_dissatisfied,
              color: const Color.fromARGB(255, 201, 117, 117),
              size: 30,
            ),
            SizedBox(width: 10),
            Text(
              isConnected
                  ? "Device Connected!"
                  : "Connect Diabetica BLE Device",
              style: TextStyle(
                color: const Color.fromARGB(255, 232, 107, 107),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(devices[index].name),
                  leading: Icon(Icons.devices),
                  onTap: () {
                    // Panggil fungsi untuk pindah ke layar Heart Rate
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HeartRateScreen(devices[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: isScanning ? null : _startScan,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isScanning
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Icon(
                          Icons.bluetooth_searching,
                          color: Colors.white,
                        ),
                  SizedBox(width: 10),
                  Text(
                    isScanning ? 'Scanning...' : 'Start Scan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Menetapkan warna latar belakang
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(350, 50), // Menetapkan lebar dan tinggi
              ),
            ),
          ),
        ],
      ),
    );
  }
}
