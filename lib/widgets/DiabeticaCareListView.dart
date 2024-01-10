import 'package:flutter/material.dart';

class DiabeticaCareListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Ganti dengan jumlah item yang Anda inginkan
        itemBuilder: (BuildContext context, int index) {
          Color cardColor;
          switch (index % 4) {
            case 0:
              cardColor = Color.fromRGBO(38, 45, 53, 1); // Warna biru pastel
              break;
            case 1:
              cardColor =
                  Color.fromRGBO(225, 240, 245, 1); // Warna hijau pastel
              break;
            case 2:
              cardColor =
                  Color.fromRGBO(234, 217, 191, 1); // Warna orange pastel
              break;
            case 3:
              cardColor = Color.fromRGBO(204, 153, 255, 1); // Warna ungu pastel
              break;
            default:
              cardColor =
                  Color.fromRGBO(128, 178, 255, 1); // Warna default biru pastel
          }

          return Container(
            width:
                MediaQuery.of(context).size.width * 0.42, // Atur lebar di sini
            child: Card(
              elevation: 2.0,
              margin: EdgeInsets.fromLTRB(
                8.0,
                8.0,
                8.0,
                16.0, // Tambahkan margin bawah di sini
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: cardColor, // Tambahkan warna pada card
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.white), // Atur warna ikon
                    SizedBox(height: 8),
                    Text(
                      'Feature $index',
                      style: TextStyle(color: Colors.white), // Atur warna teks
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
