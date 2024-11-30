import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiebackSolutionPage extends StatelessWidget {
  const DiebackSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solution: Dieback', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/dieback.png',fit: BoxFit.cover,),
            const SizedBox(height: 16),
            const Text(
              'Solution for Dieback of mango',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 30),
            const Text(
              '1. Prune and destroy affected branches.\n'
              '2. Apply appropriate fungicides.\n'
              '3. Improve drainage and avoid waterlogging.\n'
              '4. Ensure balanced fertilization to promote healthy growth.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=-KjD6_Rg20c&ab_channel=KhetikiPathshala')); // Replace with the actual link
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
