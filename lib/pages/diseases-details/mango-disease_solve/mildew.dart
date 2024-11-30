import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PowderyMildewSolutionPage extends StatelessWidget {
  const PowderyMildewSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution: Powdery Mildew', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/mildew.png',fit: BoxFit.cover,),
            const SizedBox(height: 16),
            const Text(
              'Solution for Powdery Mildew of mango',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Use resistant varieties if available.\n'
              '2. Apply fungicides such as sulfur or neem oil.\n'
              '3. Improve air circulation by proper pruning.\n'
              '4. Remove and destroy affected plant parts.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=p7_u8PqteHk&ab_channel=TrulyTropical')); // Replace with the actual link
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
