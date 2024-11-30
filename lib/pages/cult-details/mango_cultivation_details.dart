import 'package:flutter/material.dart';

class MangoCultivationDetailsPage extends StatelessWidget {
  const MangoCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mango Cultivation'),
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
                'Mango Cultivation in Bangladesh',
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
                    image: AssetImage(
                        'assets/services/crops/mango-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Mango cultivation is one of the most important agricultural sectors in Bangladesh. The country is famous for its delicious varieties of mangoes, such as Himsagar, Langra, and Amrapali. The favorable climate and soil conditions make it an ideal place for mango farming.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Mango Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Mango cultivation is thriving in Bangladesh with significant advancements in farming techniques and pest control. The export quality of Bangladeshi mangoes has also improved, leading to increased demand in international markets. This sector continues to be a major contributor to the economy.',
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
                        " Tropical and subtropical, with temperatures between 24°C and 30°C.\n"),
                    _buildTextSpan("2. Soil: ", true),
                    _buildTextSpan(" Well-drained, sandy loam soil.\n"),
                    _buildTextSpan("3. Planting Time: ", true),
                    _buildTextSpan(" June to July.\n"),
                    _buildTextSpan("4. Irrigation: ", true),
                    _buildTextSpan(
                        " Regular watering during the initial years; minimal irrigation once established.\n"),
                    _buildTextSpan("5. Harvesting: ", true),
                    _buildTextSpan(
                        "  3 to 6 months after flowering, depending on variety"),
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
