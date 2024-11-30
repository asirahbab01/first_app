import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LateBlightSolutionPage extends StatelessWidget {
  const LateBlightSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Late Blight Solution', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/tomato-lateblight.png', fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text(
              'Solution for Late Blight',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Plant disease-resistant tomato varieties.\n'
              '2. Practice crop rotation.\n'
              '3. Provide adequate spacing between plants for good air circulation.\n'
              '4. Avoid overhead watering.\n'
              '5. Remove and destroy infected plants promptly.\n'
              '6. Apply copper-based fungicides as a preventive measure.',
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
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=QEuknYpO7Eo')); // Replace with the actual link
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
