import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BotrytisBunchRotSolutionPage extends StatelessWidget {
  const BotrytisBunchRotSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Botrytis Bunch Rot Solution', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/grape-bunchrot.png', fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text(
              'Solution for Botryis Bunch Rot in Grapes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Implement good canopy management to improve air circulation.\n'
              '2. Remove infected plant debris and berries to reduce inoculum sources.\n'
              '3. Apply fungicides during the growing season, particularly during bloom and preharvest periods.\n'
              '4. Avoid overhead irrigation to reduce leaf and fruit wetness.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=jrdRPIrBe1o&ab_channel=InnoGrape')); // Replace with the actual link
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
