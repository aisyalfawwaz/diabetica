import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HeartRateScreen extends StatefulWidget {
  final BluetoothDevice device;

  HeartRateScreen(this.device);

  @override
  _HeartRateScreenState createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  String heartRateValue = "N/A"; // Menyimpan nilai Heart Rate
  String heartRateVariability = "N/A"; // Menyimpan nilai Heart Rate Variability
  String ketonValue = "N/A"; // Menyimpan nilai Keton

  @override
  void initState() {
    super.initState();
    _connectToDevice(widget.device);
  }

  void _connectToDevice(BluetoothDevice device) async {
    await device.connect();

    List<BluetoothService> services = await device.discoverServices();
    for (BluetoothService service in services) {
      if (service.uuid == Guid("19B10000-E8F2-537E-4F6C-D104768A1214")) {
        for (BluetoothCharacteristic characteristic
            in service.characteristics) {
          if (characteristic.uuid ==
              Guid("00002A37-0000-1000-8000-00805F9B34FB")) {
            // Aktifkan notifikasi
            await characteristic.setNotifyValue(true);

            // Mendengarkan perubahan nilai
            characteristic.value.listen((value) {
              // Ambil nilai pada index pertama dari array
              int heartRate = value[0];

              // Tampilkan nilai pada layout
              setState(() {
                heartRateValue = heartRate.toString();
              });
            });
          }
          // Tambahkan penanganan karakteristik untuk Heart Rate Variability dan Keton (sesuaikan dengan UUID yang sesuai)
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Monitor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.favorite, size: 40, color: Colors.red),
                    SizedBox(height: 10),
                    Text(
                      'Heart Rate',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text('Value: $heartRateValue'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Tambahkan Card dan konten untuk Heart Rate Variability dan Keton
          ],
        ),
      ),
    );
  }
}
