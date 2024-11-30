import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AnthracnoseSolutionPage extends StatelessWidget {
  const AnthracnoseSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution: Anthracnose', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/anthrac.png',fit: BoxFit.cover,width: double.infinity,),
            const SizedBox(height: 16),
            const Text(
              'Solution for Anthracnose of mango',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Remove and destroy affected leaves and twigs.\n'
              '2. Avoid overhead watering to reduce moisture on leaves.\n'
              '3. Apply appropriate fungicides as per agricultural guidelines.\n'
              '4. Ensure proper spacing and pruning to improve air circulation.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=1b9l4QT2644&ab_channel=SolutionsPest%26Lawn')); // Replace with the actual link
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
