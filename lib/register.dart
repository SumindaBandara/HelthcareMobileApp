import 'package:flutter/material.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => SignUpScreen();
}


class SignUpScreen extends State<Register1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            IconButton(
              icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),
            _buildTextField(
              hintText: "Enter your name",
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 15),
            _buildTextField(
              hintText: "Enter your email",
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 15),
            _buildTextField(
              hintText: "Enter your password",
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: "I agree to the healthcare ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Terms of Service",
                          style: const TextStyle(color: Colors.blue),
                        ),
                        const TextSpan(text: " and "),
                        TextSpan(
                          text: "Privacy Policy",
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/five');
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: isPassword
            ? Icon(Icons.visibility_off, color: Colors.grey)
            : null,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}