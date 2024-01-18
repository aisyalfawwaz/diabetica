import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:math';

class HeartRateScreen extends StatefulWidget {
  final BluetoothDevice device;

  HeartRateScreen(this.device);

  @override
  _HeartRateScreenState createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  String heartRateValue = "N/A";
  String heartRateVariability = "N/A";
  String ketonValue = "N/A";
  String glucoseValue = "N/A";
  String hba1cValue = "N/A";
  String retinopathyValue = "N/A";
  String neuropathyValue = "N/A";
  String nefropatiValue = "N/A";
  String aterosklerosisValue = "N/A";

  @override
  void initState() {
    super.initState();
    _connectToDevice(widget.device);
    _setRandomData();
  }

  void _setRandomData() {
    Random random = Random();
    glucoseValue = (80 + random.nextInt(100)).toString();
    hba1cValue = (5.0 + random.nextDouble() * (10.0 - 5.0)).toStringAsFixed(2);
    ketonValue = (0.1 + random.nextDouble() * (5.0 - 0.1)).toStringAsFixed(2);
    retinopathyValue = random.nextBool() ? 'Yes' : 'No';
    neuropathyValue = random.nextBool() ? 'Yes' : 'No';
    nefropatiValue = random.nextBool() ? 'Yes' : 'No';
    aterosklerosisValue = random.nextBool() ? 'Yes' : 'No';
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
            await characteristic.setNotifyValue(true);
            characteristic.value.listen((value) {
              int heartRate = value[0];
              _updateValue('Heart Rate', heartRate.toString());
            });
          }
        }
      }
    }
  }

  void _updateValue(String dataType, String newValue) {
    setState(() {
      switch (dataType) {
        case 'Heart Rate':
          heartRateValue = newValue;
          break;

        case 'Keton':
          ketonValue = newValue;
          break;
        case 'Glucose':
          glucoseValue = newValue;
          break;
        case 'HbA1c':
          hba1cValue = newValue;
          break;
        case 'Retinopathy':
          retinopathyValue = newValue;
          break;
        case 'Neuropathy':
          neuropathyValue = newValue;
          break;
        case 'Nefropati':
          nefropatiValue = newValue;
          break;
        case 'aterosklerosis':
          aterosklerosisValue = newValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetica Healthcare Monitor'),
        backgroundColor: Colors.blue, // Change app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildCard(
                      'Heart Rate',
                      Icons.favorite,
                      heartRateValue,
                      Colors.redAccent,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildCard(
                      'Keton',
                      Icons.local_fire_department,
                      ketonValue,
                      Colors.orange,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8), // Add spacing between the rows
              Row(
                children: [
                  Expanded(
                    child: _buildCard(
                      'Glucose',
                      Icons.local_drink,
                      glucoseValue,
                      Colors.blueAccent,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildCard(
                      'HbA1c',
                      Icons.favorite_border,
                      hba1cValue,
                      Colors.purple,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8), // Add spacing between the rows
              Row(
                children: [
                  Expanded(
                    child: _buildCard('Retinopathy', Icons.remove_red_eye,
                        retinopathyValue, Colors.brown),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildCard('Neuropathy', Icons.accessibility_new,
                        neuropathyValue, Colors.teal),
                  ),
                ],
              ),
              SizedBox(height: 8), // Add spacing between the rows
              Row(
                children: [
                  Expanded(
                    child: _buildCard('Nefropati', Icons.local_hospital,
                        nefropatiValue, Colors.brown),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: _buildCard('Aterosklerosis', Icons.health_and_safety,
                        aterosklerosisValue, Colors.teal),
                  ),
                ],
              ),
              SizedBox(height: 16), // Add spacing between the rows
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Tambahkan logika untuk AI Diabetic Detection di sini
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Start AI Diabetic Detection',
                    style: TextStyle(
                      fontSize:
                          16, // Sesuaikan ukuran font sesuai keinginan Anda
                      fontWeight: FontWeight
                          .bold, // Sesuaikan bobot huruf sesuai keinginan Anda
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String title, IconData icon, String value, Color iconColor) {
    return Row(
      children: [
        Expanded(
          child: _buildCard(title, icon, value, iconColor),
        ),
        SizedBox(width: 16), // Add spacing between the two list views
      ],
    );
  }

  Widget _buildCard(
      String title, IconData icon, String value, Color iconColor) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.lightBlueAccent],
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Icon(icon, size: 40, color: iconColor),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Change text color
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Value: $value',
                style: TextStyle(
                  color: Colors.white, // Change value text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
