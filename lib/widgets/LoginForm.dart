import 'package:diabetica/pages/UserMedicalForm.dart';
import 'package:diabetica/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  void signIn(BuildContext context) async {
    authService.signIn(
      context,
      emailController.text,
      passwordController.text,
      (errorMessage) {
        // Handle error messages here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign-in failed. $errorMessage'),
          ),
        );
      },
    );
  }

  void register(BuildContext context) {
    authService.register(context);
  }

  void signInWithGoogle(BuildContext context) async {
    await authService.signInWithGoogle(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.email, color: Colors.blue),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: _isObscure,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => signIn(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => register(context),
              child: const Text('Don\'t have an account? Register now'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => signInWithGoogle(context),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.g_mobiledata_outlined, color: Colors.blue),
                  const SizedBox(width: 10),
                  Text('Login with Google',
                      style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
