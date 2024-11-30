import 'package:flutter/material.dart';

class RoseCultivationDetailsPage extends StatelessWidget {
  const RoseCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rose Cultivation'),
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
                'Rose Cultivation in Bangladesh',
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
                    image: AssetImage('assets/services/crops/rose-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Rose cultivation in Bangladesh is renowned for its beauty and economic value. The favorable climate and soil conditions support the growth of high-quality roses. Roses are not only popular for decorative purposes but also contribute significantly to the local economy.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Rose Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The rose cultivation sector in Bangladesh has seen substantial growth due to improved farming techniques and increased demand. Farmers are using modern methods to ensure better yield and quality, making roses a profitable venture.',
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
      _buildTextSpan("  Mild, with temperatures between 15°C and 28°C.\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Well-drained, fertile soil.\n"),
      _buildTextSpan("3. Planting Time: ", true),
      _buildTextSpan(" February to March or August to September.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan(" Regular watering, especially during dry periods.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan(" Regularly throughout the blooming season."),
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