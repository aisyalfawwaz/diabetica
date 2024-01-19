import 'package:diabetica/pages/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  RegisterForm({super.key});

  Future<void> register(BuildContext context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Jika registrasi berhasil, tampilkan snackbar sukses dan pindah ke halaman login
      if (userCredential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registrasion Succes'),
          ),
        );

        // Navigasi ke halaman login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Jika terjadi kesalahan, tampilkan snackbar gagal
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registrasion Failed. ${e.message}'),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void goToLoginPage(BuildContext context) {
    Navigator.pop(context); // Kembali ke halaman sebelumnya (Login)
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          FormBuilderTextField(
            name: 'name',
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'password',
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => register(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 10), // Tambahkan ruang kosong vertikal
          TextButton(
            onPressed: () => goToLoginPage(context),
            child: const Text(
              'Sudah memiliki akun? Silahkan login sekarang',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
