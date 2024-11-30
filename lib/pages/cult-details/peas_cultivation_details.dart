import 'package:flutter/material.dart';

class PeasFarmingDetailsPage extends StatelessWidget {
  const PeasFarmingDetailsPage({super.key});

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
        title: const Text("Peas Farming"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Peas Farming in Bangladesh",
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
                    "June 18, 2023",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/services/crops/peas-cul.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              const Text(
                "Peas are annual plants, with a life cycle of one year. They are a cool-season crop grown in many parts of the world; planting can take place from winter to early summer depending on location...",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Research on Peas Farming",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Studies in the Agricultural Research Journal indicate that rotating pea crops with other legumes can enhance soil nitrogen content, leading to better yield...",
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
      _buildTextSpan(" Well-drained, loamy soil.\n"),
      _buildTextSpan("3. Planting Time: ", true),
      _buildTextSpan(" October to November in plains; February to March in hills.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan("  Moderate watering; avoid waterlogging.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan("  60 to 70 days after sowing."),
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
