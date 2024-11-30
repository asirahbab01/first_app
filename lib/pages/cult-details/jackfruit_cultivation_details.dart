import 'package:flutter/material.dart';

class JackfruitCultivationDetailsPage extends StatelessWidget {
  const JackfruitCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jackfruit Cultivation'),
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
                'Jackfruit Cultivation in Bangladesh',
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
                    image: AssetImage('assets/services/crops/jackfruit-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Jackfruit is the national fruit of Bangladesh and is widely grown across the country. The fruit is valued for its delicious taste and nutritional benefits. The primary varieties include Khaja, Gala, and Durian. Jackfruit trees are hardy and can thrive in a variety of soil types.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Jackfruit Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Jackfruit cultivation is well-established in Bangladesh. Farmers are now focusing on improving yield and quality through better farming practices and pest control measures. The export market for jackfruit is also expanding, adding to its economic significance.',
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
      _buildTextSpan("  Warm and humid, with temperatures between 25°C and 35°C\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Well-drained, sandy loam soil.\n"),
      _buildTextSpan("3. Planting Time: ", true),
      _buildTextSpan(" June to August.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan(" Regular watering during the initial years; minimal irrigation once established.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan("  8 to 10 months after flowering."),
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