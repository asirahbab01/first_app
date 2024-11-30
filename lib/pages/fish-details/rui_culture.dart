import 'package:flutter/material.dart';

class RuiCultureDetailsPage extends StatelessWidget {
  const RuiCultureDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rui Culture'),
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
                'Rui Culture in Bangladesh',
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
                    image: AssetImage('assets/fish/rui_culture.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Rui, also known as Labeo rohita, is a major carp species cultivated in Bangladesh. It is highly preferred due to its fast growth, high nutritional value, and market demand.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Rui Culture in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Rui culture has seen significant advancements with improved breeding techniques and support from government initiatives. The fish is widely farmed in ponds and rivers, contributing to the rural economy.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ideal Condition for Rui Culture',
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
                        " Subtropical climate with a temperature range between 25°C and 35°C.\n"),
                    _buildTextSpan("2. Water Quality: ", true),
                    _buildTextSpan(" Clean and oxygenated water with a pH level between 7.0 and 8.0.\n"),
                    _buildTextSpan("3. Feeding: ", true),
                    _buildTextSpan(" High-protein feed consisting of natural and supplementary feed.\n"),
                    _buildTextSpan("4. Stocking Density: ", true),
                    _buildTextSpan(" Optimal density of 2-3 fish per square meter.\n"),
                    _buildTextSpan("5. Harvesting: ", true),
                    _buildTextSpan(
                        " Typically after 12 months when the fish reach marketable size."),
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
_buildTextSpan(String text, [bool bold=false]) {
    return TextSpan(
    text: text,
    style: TextStyle(
      fontSize: 16,
      height: 1.5,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    ),
  );
}