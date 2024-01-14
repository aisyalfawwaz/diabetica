import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsPage extends StatefulWidget {
  const PermissionsPage({super.key});

  @override
  _PermissionsPageState createState() => _PermissionsPageState();
}

class _PermissionsPageState extends State<PermissionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permissions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () async {
            final Map<Permission, PermissionStatus> permissions = await [
              Permission.bluetoothScan,
              Permission.bluetoothConnect,
              Permission.location
            ].request();

            if (permissions[Permission.bluetoothScan] ==
                    PermissionStatus.granted &&
                permissions[Permission.bluetoothConnect] ==
                    PermissionStatus.granted &&
                permissions[Permission.location] == PermissionStatus.granted) {
              // All permissions are granted, proceed with scanning
              Navigator.pop(context); // Go back to the BLE Scanner page
            } else {
              // Handle the case where any permission is denied
              print('Bluetooth permissions are required.');
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text('Request Bluetooth Permissions'),
        ),
      ),
    );
  }
}
