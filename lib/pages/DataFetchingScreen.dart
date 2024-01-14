import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DataFetchingScreen extends StatefulWidget {
  const DataFetchingScreen({super.key});

  @override
  _DataFetchingScreenState createState() => _DataFetchingScreenState();
}

class _DataFetchingScreenState extends State<DataFetchingScreen> {
  bool isFetching = false;
  double fetchProgress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthcare Devices Data Fetching'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            const SizedBox(height: 20),
            _buildFetchingIllustration(),
            const SizedBox(height: 30),
            _buildConnectedDevicesCard(),
            const SizedBox(height: 30),
            _buildFetchingProgress(),
            const SizedBox(height: 30),
            _buildFetchButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      children: [
        Text(
          'Connected to Diabetica Devices',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Monitor your health with the latest Diabetica devices. Stay informed about your health data in real-time.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFetchingIllustration() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isFetching
                ? CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 10,
                    backgroundColor: Colors.red.withOpacity(0.8),
                  )
                : const Icon(
                    Icons.devices_rounded,
                    size: 80,
                    color: Colors.blue,
                  ),
          ),
        ),
        // if (isFetching) _buildSendingDataCanvas(),
      ],
    );
  }

  Widget _buildConnectedDevicesCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Connected Devices',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.bluetooth,
                color: Colors.blue,
              ),
              title: Text('Bluetooth Blood Glucose Monitor'),
            ),
            ListTile(
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text('Heart Rate Monitor'),
            ),
            // Add more connected devices as needed
          ],
        ),
      ),
    );
  }

  Widget _buildSendingDataCanvas() {
    return SizedBox(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: SendingDataPainter(),
      ),
    );
  }

  Widget _buildFetchingProgress() {
    return Column(
      children: [
        LinearPercentIndicator(
          width: 370.0,
          lineHeight: 20.0,
          percent: fetchProgress,
          center: Text(
            '${(fetchProgress * 100).toInt()}%',
            style: const TextStyle(color: Colors.white),
          ),
          linearStrokeCap: LinearStrokeCap.roundAll,
          progressColor: Colors.blue,
          backgroundColor: Colors.red.withOpacity(0.8),
        ),
        const SizedBox(height: 20),
        Text(
          isFetching ? 'Fetching Data...' : 'Data Fetched',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildFetchButton() {
    return ElevatedButton(
      onPressed: () {
        _startFetchingData();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: const Text(
        'Start Fetching Data',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    );
  }

  void _startFetchingData() {
    setState(() {
      isFetching = true;
    });

    // Simulate fetching data with progress updates
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        fetchProgress = 0.2;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        fetchProgress = 0.5;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        fetchProgress = 0.8;
      });
    });

    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        fetchProgress = 1.0;
        isFetching = false;
      });
    });
  }
}

class SendingDataPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    // Draw a line representing data being sent
    canvas.drawLine(const Offset(0, 0), Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
