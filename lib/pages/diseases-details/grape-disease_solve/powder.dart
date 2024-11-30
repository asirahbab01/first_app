import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PowderyMildewGrapeSolutionPage extends StatelessWidget {
  const PowderyMildewGrapeSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Powdery Mildew Solution', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/mildew-grapes.png', fit: BoxFit.cover,),
            const SizedBox(height: 16),
            const Text(
              'Solution for Powdery Mildew in Grapes',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Apply sulfur or other fungicides at the first sign of disease.\n'
              '2. Ensure good air circulation by proper pruning and spacing of plants.\n'
              '3. Use resistant varieties if available.\n'
              '4. Avoid excessive nitrogen fertilization which can promote dense foliage.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=Thr0nMhZxeY')); // Replace with the actual link
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
