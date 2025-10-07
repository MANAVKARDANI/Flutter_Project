import 'package:flutter/material.dart';
import 'home_screen.dart'; // Ensure this path is correct

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isPasswordVisible = false;



  // Form Submission
  Future<void> _submitForm() async {
    _formKey.currentState?.save();

    // Mock login - simulate successful authentication
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    
    // Simulate a login success
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Login Successful'),
    ));

    // Redirect to HomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to HomeScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const Image(
                image: AssetImage('assets/Frame.png'), // Ensure correct path
                height: 100,
              ),
              const SizedBox(height: 16.0),

              // App Title
              const Text(
                'DocBook',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32.0),

              // Email Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value,
              ),
              const SizedBox(height: 16.0),

              // Password Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !isPasswordVisible,
                onSaved: (value) => password = value,
              ),
              const SizedBox(height: 16.0),

              // Login Button
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Login', style: TextStyle(fontSize: 18.0)),
              ),
              const SizedBox(height: 16.0),

              // Forgot Password Link
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgot-password');
                },
                child: const Text(
                  'Forgot password',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              const SizedBox(height: 16.0),

              // Don't have an account? Sign Up
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/signup'); // Navigate to Sign Up page
                },
                child: const Text(
                  'Don\'t have an account? Join us',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
