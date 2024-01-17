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

  @override
  void initState() {
    super.initState();
    _startScan();
  }

  void _startScan() {
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

    FlutterBluePlus.startScan();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Tombol back ditekan
        // Kembali ke custom bottom bar
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => CustomBottomBar()));
        return true;
      },
      child: Scaffold(
        body: Column(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  onPressed: _startScan,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.bluetooth_searching,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Start Scan',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
