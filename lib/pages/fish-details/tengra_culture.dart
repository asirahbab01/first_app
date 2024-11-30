import 'package:flutter/material.dart';

class TengraCultureDetailsPage extends StatelessWidget {
  const TengraCultureDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tengra Culture'),
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
                'Tengra Culture in Bangladesh',
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
                    image: AssetImage('assets/fish/tengra_culture.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tengra, also known as Mystus tengara, is a small indigenous species of catfish. It is commonly found in rivers and ponds across Bangladesh and is known for its taste and nutritional value.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Tengra Culture in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Tengra is widely cultured in freshwater bodies, with traditional and semi-intensive methods being common. Efforts are being made to improve breeding practices and increase production.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ideal Condition for Tengra Culture',
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
                        " Subtropical climate with temperatures ranging between 22°C and 30°C.\n"),
                    _buildTextSpan("2. Water Quality: ", true),
                    _buildTextSpan(" Freshwater with adequate oxygen levels and a pH of 6.5 to 7.5.\n"),
                    _buildTextSpan("3. Feeding: ", true),
                    _buildTextSpan(" Natural feed such as insects, plankton, and small invertebrates.\n"),
                    _buildTextSpan("4. Stocking Density: ", true),
                    _buildTextSpan(" Moderate stocking density to avoid overcrowding and ensure healthy growth.\n"),
                    _buildTextSpan("5. Harvesting: ", true),
                    _buildTextSpan(
                        " Harvested after 6-8 months when they reach a size of 50-100 grams."),
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
