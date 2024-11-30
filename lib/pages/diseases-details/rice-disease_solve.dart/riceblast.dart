import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class RiceBlastSolutionPage extends StatelessWidget {
  const RiceBlastSolutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rice Blast Solution', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset('assets/solutions/rice-blast.png', fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text(
              'Solution for Rice Blast Disease',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Text(
              '1. Use resistant rice varieties.\n'
              '2. Practice crop rotation with non-rice crops.\n'
              '3. Manage irrigation to avoid prolonged leaf wetness.\n'
              '4. Apply fungicides preventively or at the first sign of infection.\n'
              '5. Remove and destroy infected plant material.',
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
                        launchUrl(Uri.parse('https://www.youtube.com/watch?v=flLX275w6UM&ab_channel=AllianceofBioversityInternationalandCIAT')); // Replace with the actual link
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
