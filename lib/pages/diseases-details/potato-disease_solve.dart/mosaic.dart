import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MosaicVirusSolutionPage extends StatelessWidget {
  const MosaicVirusSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mosaic Virus Solution', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/mosaic.png', fit: BoxFit.cover,),
            const SizedBox(height: 16),
            const Text(
              'Solution for Mosaic virus of potato',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Use certified virus-free seed potatoes.\n'
              '2. Control aphid populations that transmit the virus.\n'
              '3. Remove and destroy infected plants to reduce sources of virus.\n'
              '4. Implement crop rotation with non-host crops.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=53ZlXFjqbeU')); // Replace with the actual link
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
