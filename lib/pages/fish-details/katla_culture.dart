import 'package:flutter/material.dart';

class KatlaCultureDetailsPage extends StatelessWidget {
  const KatlaCultureDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katla Culture'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Katla Culture in Bangladesh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Chip(
                    label: Text(
                      "Fish",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Aug 26, 2024",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/fish/catla_culture.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Katla, also known as Catla catla, is one of the major carp species cultivated in Bangladesh. It is valued for its fast growth and high market demand.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Katla Culture in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Katla is extensively cultured in ponds and rivers, contributing significantly to fish production in Bangladesh. Advances in breeding and feeding techniques have improved yields.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ideal Condition for Katla Culture',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    _buildTextSpan("1. Climate: ", true),
                    _buildTextSpan(
                        " Subtropical climate with temperatures ranging between 25°C and 35°C.\n"),
                    _buildTextSpan("2. Water Quality: ", true),
                    _buildTextSpan(" Clean and oxygenated water with a pH of 7.0 to 8.0.\n"),
                    _buildTextSpan("3. Feeding: ", true),
                    _buildTextSpan(" Rich diet consisting of plankton and supplementary feed.\n"),
                    _buildTextSpan("4. Stocking Density: ", true),
                    _buildTextSpan(" Optimal density of 1-2 fish per square meter.\n"),
                    _buildTextSpan("5. Harvesting: ", true),
                    _buildTextSpan(
                        " Harvested after 12 months when the fish reach a weight of 2-3 kg."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
_buildTextSpan(String text, [bool bold = false]) {
  return TextSpan(
    text: text,
    style: TextStyle(
      fontSize: 16,
      height: 1.5,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    ),
  );
}