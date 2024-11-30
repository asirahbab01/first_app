import 'package:flutter/material.dart';

class CarrotCultivationDetailsPage extends StatelessWidget {
  const CarrotCultivationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrot Cultivation'),
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
                'Carrot Cultivation in Bangladesh',
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
                    image: AssetImage('assets/services/crops/carrot-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Carrot is another important crop cultivated in Bangladesh. The sandy loam soil and favorable climatic conditions of the country provide an excellent environment for carrot growth. Carrot farming has become increasingly popular among farmers due to its high demand and profitability.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Carrot Cultivation in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'In recent years, carrot cultivation has seen significant growth in Bangladesh. The use of improved seeds and advanced farming techniques has led to higher yields and better quality produce. Farmers are also receiving training and support from agricultural organizations, further boosting carrot production in the region.',
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
                        " GHerminate best in soil temperatures between 10-21°C.\n"),
                    _buildTextSpan("2. Soil: ", true),
                    _buildTextSpan(" Prefer loose, sandy loam soil with a pH between 6.0 and 7.0\n"),
                    _buildTextSpan("3. Planting Time: ", true),
                    _buildTextSpan(" In warmer climates where summers are scorching, planting carrots in the fall or even early winter is recommended.\n"),
                    _buildTextSpan("4. Irrigation: ", true),
                    _buildTextSpan(
                        "  Aim to keep the soil consistently moist but not soggy.\n"),
                    _buildTextSpan("5. Harvesting: ", true),
                    _buildTextSpan(
                        "  60 to 70 days after planting, depending on the variety."),
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
