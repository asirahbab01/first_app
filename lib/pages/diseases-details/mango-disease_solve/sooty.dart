import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SootyMoldSolutionPage extends StatelessWidget {
  const SootyMoldSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution: Sooty Mold', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/mold.png', fit: BoxFit.cover,),
            const SizedBox(height: 16),
            const Text(
              'Solution for Sooty Mold of mango',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Control the insect population (e.g., aphids) that produce honeydew.\n'
              '2. Wash off the mold with water or mild soap solution.\n'
              '3. Apply horticultural oil to prevent mold formation.\n'
              '4. Maintain good air circulation by proper pruning.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=j87g7zASXoU&ab_channel=HabibFarming')); // Replace with the actual link
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
