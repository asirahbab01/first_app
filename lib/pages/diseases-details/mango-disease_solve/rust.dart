import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RedRustSolutionPage extends StatelessWidget {
  const RedRustSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution: Red Rust', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset
            ('assets/solutions/rust.png',
            fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'Solution for Red Rust of mango',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Remove and destroy infected leaves.\n'
              '2. Apply copper-based fungicides as per guidelines.\n'
              '3. Maintain proper hygiene and sanitation in the orchard.\n'
              '4. Ensure adequate spacing and pruning for better air circulation.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  const TextSpan(text: "Want more details  "),
                  TextSpan(
                    text: "Click here",
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=Iyw8FvQvYRg&ab_channel=SudiptaSatpati')); // Replace with the actual link
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
