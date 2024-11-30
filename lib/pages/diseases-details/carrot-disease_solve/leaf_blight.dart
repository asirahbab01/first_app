import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AlternariaLeafBlightSolutionPage extends StatelessWidget {
  const AlternariaLeafBlightSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alternaria Leaf Blight Solution',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(
              'assets/solutions/leaf-blight.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'Solution for Alternaria Leaf Blight',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Practice crop rotation to avoid the buildup of the pathogen in the soil.\n'
              '2. Remove and destroy infected plant debris to reduce sources of infection.\n'
              '3. Apply fungicides as recommended to control the disease.\n'
              '4. Use resistant varieties if available.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
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
                        launchUrl(Uri.parse(
                            'https://www.youtube.com/watch?v=pVZzaiWpd34')); // Replace with the actual link
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
