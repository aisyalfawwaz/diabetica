import 'package:flutter/material.dart';

class AddMedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Medicine'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Medicine Name'),
              // Add logic to handle the medicine name input
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Medicine Type'),
              // Add logic to handle the medicine type input
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Dosage'),
              // Add logic to handle the dosage input
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Time'),
              // Add logic to handle the time input
            ),
            SwitchListTile(
              title: Text('Turn on Notification'),
              value: false,
              onChanged: (value) {
                // Add logic to handle notification switch
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Add logic to save medicine details
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
