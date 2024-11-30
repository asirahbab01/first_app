import 'package:flutter/material.dart';

class LitchiCultivationDetailsPage extends StatelessWidget {
  const LitchiCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Litchi Cultivation'),
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
                'Litchi Cultivation in Bangladesh',
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
                    image: AssetImage('assets/services/crops/litchi-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Litchi is one of the most popular fruits in Bangladesh. The country’s warm and humid climate is ideal for litchi cultivation. The main varieties grown include Bombai, Madraji, and Bedana. Litchi orchards are predominantly found in the northern and northwestern regions.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Litchi Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Litchi cultivation is flourishing in Bangladesh. With the implementation of improved agricultural practices and pest management strategies, farmers are able to achieve higher yields and better fruit quality. Litchi is also gaining recognition in international markets.',
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
                  _buildTextSpan("Warm and humid; temperatures between 25°C and 35°C.\n"),
                  _buildTextSpan("2. Soil: ", true),
                  _buildTextSpan("Well-drained, fertile, sandy loam soil with good organic content.\n"),
                  _buildTextSpan("3. Planting Time: ", true),
                  _buildTextSpan("Late spring to early summer.\n"),
                  _buildTextSpan("4. Irrigation: ", true),
                  _buildTextSpan("Regular watering during dry periods; soil should be kept moist.\n"),
                  _buildTextSpan("5. Harvesting: ", true),
                  _buildTextSpan("Summer, typically 100 to 120 days after flowering."),
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