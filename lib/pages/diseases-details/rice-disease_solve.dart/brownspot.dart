import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BrownSpotSolutionPage extends StatelessWidget {
  const BrownSpotSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brown Spot Solution', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/rice-brownspot.png', fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text(
              'Solution for Brown Spot Disease',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Use resistant rice varieties.\n'
              '2. Practice crop rotation with non-rice crops for at least 2-3 years.\n'
              '3. Avoid excessive nitrogen fertilization.\n'
              '4. Maintain proper water management to prevent waterlogging.\n'
              '5. Apply fungicides at the early stages of the disease.\n'
              '6. Collect and burn infected plant residues to prevent disease spread.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=evSCl6-JlVI&ab_channel=BigHaatTV')); // Replace with the actual link
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
