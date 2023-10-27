import 'package:brl_task1/Pages/SignupPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key, required String title}) : super(key: key);
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword() async {
    final String email = emailController.text.trim();
    if (email == "") {
      print("Please fill in this field");
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print("Please check your inbox for a password reset email.");
    } catch (e) {
      print('An error occurred. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.4,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image_vortex.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FORGOT PASSWORD',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: emailController,
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w800,
                      ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.mail),
                        labelText: 'Email *',
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: resetPassword,
                      child: Text('Submit'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text("Create a new account? Sign Up"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
