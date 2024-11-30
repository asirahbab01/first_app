import 'package:flutter/material.dart';

class TomatoCultivationDetailsPage extends StatelessWidget {
  const TomatoCultivationDetailsPage({super.key});

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
        title: const Text("Tomato Cultivation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tomato Cultivation in Bangladesh",
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
              Image.asset(
                'assets/services/crops/tomato.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              const Text(
                "Bangladesh, known for its fertile soil, is an ideal place for tomato cultivation. The favorable climatic conditions, such as moderate temperature and sufficient rainfall, support the growth of healthy tomato plants throughout the year.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Present status of tomato cultivation in Bangladesh",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Tomato cultivation in Bangladesh has seen significant growth over the past few years. With advancements in agricultural practices and the adoption of new varieties, the yield and quality of tomatoes have improved remarkably. Farmers are now able to produce tomatoes that meet both local and international market demands.",
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
      _buildTextSpan("  Warm, with temperatures between 20°C and 25°C.\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Well-drained, sandy-loam soil.\n"),
      _buildTextSpan("3. Sowing Time: ", true),
      _buildTextSpan(" October to November for winter crop; July for monsoon crop.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan(" Regular watering, especially during flowering and fruiting stages.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan(" 60 to 85 days after transplanting."),
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
