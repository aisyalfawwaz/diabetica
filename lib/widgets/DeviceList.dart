import 'package:flutter/material.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 0, // Replace with your device count
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              title: const Text(
                'Unknown Device',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text(
                'Device ID',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Handle device tap
              },
            ),
          );
        },
      ),
    );
  }
}
