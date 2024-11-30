import 'package:flutter/material.dart';

class BananaCultivationDetailsPage extends StatelessWidget {
  const BananaCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banana Cultivation'),
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
                'Banana Cultivation in Bangladesh',
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
                      "Fruits",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "July 5, 2024",
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
                    image: AssetImage('assets/services/crops/banana-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Banana cultivation is widespread in Bangladesh due to its suitable tropical climate. Bananas are a staple fruit and are cultivated both for local consumption and export. The primary varieties include Cavendish, Sagar, and Sabri.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Banana Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Banana cultivation has been steadily increasing with the adoption of modern agricultural techniques and government support. Farmers are now able to produce higher yields and better quality bananas, contributing significantly to the economy.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ideal Condition for Cultivation',
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
                        " Tropical and subtropical, with temperatures between 25°C and 30°C.\n"),
                    _buildTextSpan("2. Soil: ", true),
                    _buildTextSpan(" Well-drained, loamy soil rich in organic matter.\n"),
                    _buildTextSpan("3. Planting Time: ", true),
                    _buildTextSpan(" Throughout the year in irrigated areas; with the onset of monsoon in rain-fed areas.\n"),
                    _buildTextSpan("4. Irrigation: ", true),
                    _buildTextSpan(
                        "  Frequent irrigation, especially during dry periods.\n"),
                    _buildTextSpan("5. Harvesting: ", true),
                    _buildTextSpan(
                        "  12 to 15 months after planting."),
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
