import 'package:flutter/material.dart';

class GrapeCultivationDetailsPage extends StatelessWidget {
  const GrapeCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grape Cultivation'),
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
                'Grape Cultivation in Bangladesh',
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
                    image: AssetImage('assets/services/crops/grape-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Grape cultivation is gradually gaining popularity in Bangladesh. With the introduction of suitable grape varieties and improved farming techniques, farmers are now able to cultivate grapes successfully. The main grape varieties include Baganapalli and Sharad Seedless.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Grape Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Grape cultivation is still in its early stages, but it shows significant potential. Farmers are adopting modern techniques and receiving support from agricultural experts. The successful cultivation of grapes could open up new opportunities for the fruit industry in Bangladesh.',
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
                  _buildTextSpan("Warm, dry, and sunny; temperatures between 15°C and 30°C.\n"),
                  _buildTextSpan("2. Soil: ", true),
                  _buildTextSpan("Well-drained, sandy loam to clay loam soil with good organic matter.\n"),
                  _buildTextSpan("3. Planting Time: ", true),
                  _buildTextSpan("Late winter to early spring.\n"),
                  _buildTextSpan("4. Irrigation: ", true),
                  _buildTextSpan("Moderate watering; ensure soil is moist but not waterlogged.\n"),
                  _buildTextSpan("5. Harvesting: ", true),
                  _buildTextSpan("Late summer to early autumn, typically 16 to 18 weeks after planting."),
                ],
              ),
            ),
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
