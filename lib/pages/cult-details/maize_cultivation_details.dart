import 'package:flutter/material.dart';

class MaizeCultivationDetailsPage extends StatelessWidget {
  const MaizeCultivationDetailsPage({super.key});

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
        title: const Text("Maize Cultivation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Maize Cultivation in Bangladesh",
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
                    "May 10, 2023",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/services/crops/maize-cul.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                "Maize, also known as corn, is a cereal grain first domesticated by indigenous peoples in southern Mexico about 10,000 years ago.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Research on Maize Cultivation",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Research published in the Journal of Crop Science shows that the implementation of integrated pest management (IPM) techniques can significantly reduce crop loss in maize.",
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
      _buildTextSpan(" Maize prefers warm weather with average daily temperatures between 68-86°F (20-30°C) during the growing season.\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Maize grows best in well-drained, fertile soils with a loose and loamy texture. Sandy loam or silt loam soils are ideal.\n"),
      _buildTextSpan("3. Planting Time: ", true),
      _buildTextSpan("  In Spring season.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan("  Maize needs to be watered deeply every 5-7 days during dry periods.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan("  Avoid harvesting maize in wet conditions as this can lead to mold growth and make it more difficult to dry the grain properly."),
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
