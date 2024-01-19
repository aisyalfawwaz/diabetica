import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiabeticRetinopathyDetection extends StatefulWidget {
  @override
  _DiabeticRetinopathyDetectionState createState() =>
      _DiabeticRetinopathyDetectionState();
}

class _DiabeticRetinopathyDetectionState
    extends State<DiabeticRetinopathyDetection> {
  bool isDetecting = false;
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _startDetection() async {
    setState(() {
      isDetecting = true;
    });

    // Simulate detection for 3 seconds (Replace with actual detection logic)
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      isDetecting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetic Retinopathy Detection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          _selectedImage != null
              ? Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: FileImage(_selectedImage!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey,
                  ),
                ),
          const SizedBox(height: 8),
          Text(
            'Selected Image',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text('Choose Image'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey.shade300),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Instructions:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '1. Choose an eye fundus image from your device.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '2. Press the "Detect" button to start the detection process.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isDetecting ? null : _startDetection,
              child: isDetecting
                  ? CircularProgressIndicator()
                  : Text(
                      'Detect',
                      style: TextStyle(
                        fontSize: 16, // Adjust the font size as needed
                        fontWeight:
                            FontWeight.bold, // You can adjust the font weight
                        color: Colors.white, // Change the text color
                        // You can add more styles like fontFamily, letterSpacing, etc.
                      ),
                    ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
