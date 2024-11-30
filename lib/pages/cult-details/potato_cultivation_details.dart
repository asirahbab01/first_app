import 'package:flutter/material.dart';

class PotatoCultivationDetailsPage extends StatelessWidget {
  const PotatoCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Cultivation'),
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
                'Potato Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Chip(
                    label: Text("Vegetables",style: TextStyle(color: Colors.white),),
                    backgroundColor: Colors.green, 
                  ),
                  SizedBox(width: 8),
                  Text(
                    "July 5,2024",
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
                    image: AssetImage('assets/services/crops/potato-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Bangladesh is known for its rich agricultural heritage and diverse crop production. Among the various crops, potato is a significant one, contributing to the country\'s economy and food security. The favorable climatic conditions in Bangladesh make it ideal for potato cultivation throughout the year.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Potato Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Potato cultivation in Bangladesh is practiced extensively, with significant areas dedicated to this crop. The country has a suitable environment with adequate rainfall and temperature, which promotes high yields. Modern agricultural techniques and government support have further enhanced potato production in recent years.',
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
      _buildTextSpan("  Cool, with temperatures between 10°C and 25°C.\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Well-drained, sandy-loam soil.\n"),
      _buildTextSpan("3. Planting Time: ", true),
      _buildTextSpan(" October to November in plains; February to March in hills..\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan("  Frequent irrigation, especially during tuber formation.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan(" 90 to 120 days after planting."),
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
