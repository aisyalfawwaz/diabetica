import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Aisy Al Fawwaz',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black), // Berikan warna putih pada teks
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              '21 Tahun',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black), // Berikan warna putih pada teks
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.blue[700], // Berikan warna biru laut pada Card
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      'Informasi Kesehatan',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white), // Berikan warna putih pada teks
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(
                      color: Colors.white), // Berikan warna putih pada Divider
                  ListTile(
                    leading: const Icon(Icons.favorite,
                        color: Colors.red), // Berikan warna merah pada ikon
                    title: const Text('Riwayat Glukosa',
                        style: TextStyle(
                            color:
                                Colors.white)), // Berikan warna putih pada teks
                    onTap: () {
                      // Navigasi ke riwayat glukosa
                    },
                  ),
                  const Divider(
                      color: Colors.white), // Berikan warna putih pada Divider
                  ListTile(
                    leading: const Icon(Icons.article,
                        color: Colors.green), // Berikan warna hijau pada ikon
                    title: const Text('Artikel Kesehatan',
                        style: TextStyle(
                            color:
                                Colors.white)), // Berikan warna putih pada teks
                    onTap: () {
                      // Navigasi ke halaman artikel kesehatan
                    },
                  ),
                  const Divider(
                      color: Colors.white), // Berikan warna putih pada Divider
                  ListTile(
                    leading: const Icon(Icons.schedule,
                        color: Colors.blue), // Berikan warna biru pada ikon
                    title: const Text('Jadwal Kesehatan',
                        style: TextStyle(
                            color:
                                Colors.white)), // Berikan warna putih pada teks
                    onTap: () {
                      // Navigasi ke jadwal kesehatan
                    },
                  ),
                  const Divider(
                      color: Colors.white), // Berikan warna putih pada Divider
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
