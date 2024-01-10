import 'package:diabetica/widgets/DataFetchingWidget.dart';
import 'package:flutter/material.dart';

class DataFetchingPage extends StatefulWidget {
  @override
  _DataFetchingPageState createState() => _DataFetchingPageState();
}

class _DataFetchingPageState extends State<DataFetchingPage> {
  bool _isFetching = false;

  Future<void> fetchData() async {
    setState(() {
      _isFetching = true;
    });

    // Method untuk fetching data dari perangkat keras diabetic
    // Misalnya, panggil method atau fungsi untuk fetching data di sini

    // Contoh delay fetching selama 3 detik
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Fetching Page'),
      ),
      body: DataFetchingWidget(
        isFetching: _isFetching,
        onPressed: () => fetchData(),
      ),
    );
  }
}
