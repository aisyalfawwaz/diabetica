import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://www.pngall.com/wp-content/uploads/5/Profile-Avatar-PNG.png',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Aisy Al Fawwaz',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              '21 Tahun',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Card(
              elevation: 5,
              margin:
                  EdgeInsets.fromLTRB(20, 0, 20, 20), // Tambahkan margin bawah
              color: Colors.blue[700],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Informasi Kesehatan',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite, color: Colors.red),
                    title: Text(
                      'Riwayat Glukosa',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigasi ke riwayat glukosa
                    },
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(Icons.article, color: Colors.green),
                    title: Text(
                      'Artikel Kesehatan',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigasi ke halaman artikel kesehatan
                    },
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ListTile(
                    leading: Icon(Icons.schedule, color: Colors.blue),
                    title: Text(
                      'Jadwal Kesehatan',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigasi ke jadwal kesehatan
                    },
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  // Tambahkan fitur-fitur kesehatan lainnya
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
