import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CavitySpotSolutionPage extends StatelessWidget {
  const CavitySpotSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cavity Spot Solution', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/harvesting-carrot.png', fit: BoxFit.cover,),
            const SizedBox(height: 16),
            const Text(
              'Solution for Cavity Spot',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Ensure proper soil drainage to prevent waterlogging.\n'
              '2. Rotate crops to reduce soilborne pathogens.\n'
              '3. Use resistant carrot varieties if available.\n'
              '4. Apply appropriate fungicides as a preventive measure.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=GhMy6f88geM')); // Replace with the actual link
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
