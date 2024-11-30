import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BlackMoldSolutionPage extends StatelessWidget {
  const BlackMoldSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Black Mold Solution',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/tomato-blackmold.png',
                fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text(
              'Solution for Black Mold ',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Control insect populations: Use insecticidal soap or neem oil to manage aphids and whiteflies.\n'
              '2. Clean plants: Gently wash off the black mold with a water hose or a mild soap solution.\n'
              '3.Improve air circulation: Space plants adequately and prune to allow for better airflow.\n'
              '4. Preventative measures: Monitor plants regularly for insect infestations and treat promptly.',
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
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse(
                            'https://www.youtube.com/watch?v=QhHOKlZWH1o')); // Replace with the actual link
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
