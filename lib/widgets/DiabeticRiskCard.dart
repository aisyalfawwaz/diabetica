import 'package:diabetica/pages/BleDiabeticaConnect.dart';
import 'package:flutter/material.dart';

class DiabeticRiskCard extends StatelessWidget {
  const DiabeticRiskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: const Color.fromRGBO(22, 25, 27, 1),
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Get to Know Your Diabetic Risk Level',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Non-Invasive and Fastly',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle "Get Started" button pressed
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeviceListScreen()),
                          );
                        },
                        child: const Text('Get Started'),
                      ),
                    ],
                  ),
                ),
                // Container untuk menampung gambar dan menyesuaikan tingginya
                SizedBox(
                  height: 130,
                  width: 100, // Sesuaikan lebar gambar sesuai kebutuhan
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/010/871/126/original/3d-avatar-doctor-png.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20), // Adjust the spacing as needed
      ],
    );
  }
}
