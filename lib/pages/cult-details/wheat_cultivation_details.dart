import 'package:flutter/material.dart';

class WheatCultivationDetailsPage extends StatelessWidget {
  const WheatCultivationDetailsPage({super.key});

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
        title: const Text("Wheat Cultivation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Wheat Cultivation in Bangladesh",
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
                    "March 22, 2023",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/services/crops/wheat-cul.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 16),
              const Text(
                "The wheat crop requires a well-pulverized but compact seedbed. Wheat is a staple food crop grown in various regions worldwide. The wheat crop requires a well-pulverized but compact seed bed for good and uniform germination...",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Research on Wheat Cultivation",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "According to a study published in the Journal of Agricultural Science, the yield of wheat can be significantly increased by optimizing irrigation and fertilization strategies...",
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
      _buildTextSpan("   Cool, with temperatures between 15°C and 20°C.\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Well-drained, loamy soil.\n"),
      _buildTextSpan("3. Sowing Time: ", true),
      _buildTextSpan("  November to December.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan("   Regular watering, especially during critical growth stages.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan("  4 to 5 months after sowing."),
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
