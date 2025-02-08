// Suggested code may be subject to a license. Learn more: ~LicenseLog:1433568870.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4287200626.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3765974906.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:777442095.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3738160161.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2330001379.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1485830243.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3217896667.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:215746007.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:526870872.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:83568174.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1505348228.

import 'package:flutter/material.dart';

import 'signup_screen.dart';
import 'chat_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
               decoration: InputDecoration(
                labelText: 'Password',
                 border: const OutlineInputBorder(),
                 suffixIcon: IconButton(
                   icon: Icon(
                     _obscureText ? Icons.visibility : Icons.visibility_off,
                   ),
                   onPressed: () {
                     setState(() {
                       _obscureText = !_obscureText;
                     });
                   },
                 ),
              ),
               obscureText: _obscureText,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatScreen()),
                      (route) => false,
                    );
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                );
              },
              child: const Text('Forgot Password?'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                   Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      (route) => false,
                    );
                    
                  },
                  child: const Text('Sign up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
