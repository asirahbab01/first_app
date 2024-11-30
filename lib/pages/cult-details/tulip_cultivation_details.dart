import 'package:flutter/material.dart';

class TulipCultivationDetailsPage extends StatelessWidget {
  const TulipCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tulip Cultivation'),
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
                'Tulip Cultivation in Bangladesh',
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
                      "Flowers",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "July 8, 2024",
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
                    image: AssetImage('assets/services/crops/tulip-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tulips are a symbol of beauty and elegance. In Bangladesh, tulip cultivation is relatively new but rapidly growing due to favorable conditions. The vibrant colors and unique shapes of tulips make them a favorite among flower enthusiasts and decorators.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Tulip Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tulip cultivation in Bangladesh is on the rise, with more farmers showing interest in this high-value crop. The government and various agricultural organizations are providing support and training to promote tulip farming, ensuring its growth and sustainability.',
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
              const SizedBox(height: 8),
RichText(
  text: TextSpan(
    style: const TextStyle(color: Colors.black),
    children: [
      _buildTextSpan("1. Climate: ", true),
      _buildTextSpan(" Cool, with temperatures between 12°C and 20°C.\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Well-drained, sandy loam soil.\n"),
      _buildTextSpan("3. Planting Time: ", true),
      _buildTextSpan(" Autumn.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan(" Moderate watering; ensure soil is moist but not waterlogged.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan(" Spring, typically 10 to 12 weeks after planting."),
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
