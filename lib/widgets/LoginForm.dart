import 'package:diabetica/pages/RegisterPage.dart';
import 'package:diabetica/widgets/CustomBottomDart.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Jika login berhasil, lakukan navigasi ke halaman selanjutnya
      if (userCredential.user != null) {
        // Navigator.pushReplacement...
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Tampilkan pesan error untuk user tidak ditemukan
        print('User not found');
      } else if (e.code == 'wrong-password') {
        // Tampilkan pesan error untuk password salah
        print('Wrong password');
      }
    }
  }

  void register(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              RegisterPage()), // Ganti RegisterPage() dengan halaman register yang sesuai
    );
  }

  void signinsementara(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CustomBottomBar()), // Ganti RegisterPage() dengan halaman register yang sesuai
    );
  }

  void signInWithGoogle(BuildContext context) {
    // TODO: Login dengan Google menggunakan Firebase
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => signinsementara(context),
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Background color
              onPrimary: Colors.white, // Text color
              padding: EdgeInsets.symmetric(vertical: 16), // Button padding
            ),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () => register(context),
            child: Text('Belum memiliki akun? Register sekarang'),
          ),
          SizedBox(height: 10),
          OutlinedButton(
            onPressed: () => signInWithGoogle(context),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.g_mobiledata_outlined, color: Colors.blue),
                SizedBox(width: 10),
                Text('Login dengan Google'),
              ],
            ),
            style: OutlinedButton.styleFrom(
              primary: Colors.blue, // Border color
              side: BorderSide(color: Colors.blue), // Border style
              padding: EdgeInsets.symmetric(vertical: 16), // Button padding
            ),
          ),
        ],
      ),
    );
  }
}
