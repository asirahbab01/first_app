import 'package:flutter/material.dart';

class JuteCultivationDetailsPage extends StatelessWidget {
  const JuteCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Jute Cultivation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Jute Cultivation in Bangladesh",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Chip(
                    label: Text("Crops",style: TextStyle(color: Colors.white),),
                    backgroundColor: Colors.green, 
                  ),
                  SizedBox(width: 8),
                  Text(
                    "April 15, 2023",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/services/crops/jute-cul.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              const Text(
                "Jute is a long, soft, shiny vegetable fiber that can be spun into coarse, strong threads. It is produced primarily from plants in the genus Corchorus, which was once classified with the family Tiliaceae...",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Research on Jute Cultivation",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "A study from the International Journal of Agronomy highlights the importance of soil quality and nutrient management in increasing the yield of jute...",
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
      _buildTextSpan("  Warm and humid, with temperatures between 24°C and 37°C.\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Alluvial soil with good drainage.\n"),
      _buildTextSpan("3. Sowing Time: ", true),
      _buildTextSpan("  March to May.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan("   Regular irrigation during the early stages, but less water during later stages.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan("  4 to 5 months after sowing."),
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

