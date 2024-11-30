import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SheathBlightSolutionPage extends StatelessWidget {
  const SheathBlightSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sheath Blight Solution', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/rice-sheathblight.png', fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text(
              'Solution for Sheath Blight Disease',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Select rice varieties with resistance to sheath blight.\n'
              '2. Practice balanced fertilization, avoiding excessive nitrogen application.\n'
              '3. Manage irrigation to avoid prolonged periods of leaf wetness.\n'
              '4. Apply fungicides preventively or at the first sign of infection.\n'
              '5. Manage crop residues by incorporating them into the soil after harvest.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=hEj9HeSyCfg&ab_channel=AkyBiotech')); // Replace with the actual link
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
