import 'package:flutter/material.dart';

class RiceCultivationDetailsPage extends StatelessWidget {
  const RiceCultivationDetailsPage({super.key});

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
        title: const Text("Rice Cultivation"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Rice Cultivation in Bangladesh",
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
                    "Feb 12, 2023",
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
                    image: AssetImage('assets/services/crops/rice-cul.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Bangladesh has a chiefly an agrarian economy where rice is the dominant crop. The climatic condition in Bangladesh also enables the year-round production of rice. Thus, rice is an integral part of the dietary culture and the main source of nutrition for the people. Also, rice production is the major source of income in rural areas.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Present status of rice cultivation in Bangladesh",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Bangladesh has a tropical climate with considerable variation in climatic parameters, such as temperature and rainfall. The total area of the country is 14.86 million (147,570 square kilometers), and the cultivable area is 8,585,207 hectares. In 2023, Bangladesh produced about 39.1 million tonnes of rice, making it the world's third-largest producer. Rice is cultivated in three seasons in Bangladesh: aman, aus, and boro. Rice covers 77% of the total cropped area in Bangladesh, which is around 16.06 million hectares.",
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
      _buildTextSpan("  Warm and humid, with temperatures between 20°C and 35°C.\n"),
      _buildTextSpan("2. Soil: ", true),
      _buildTextSpan(" Clayey, loamy soil with good water retention.\n"),
      _buildTextSpan("3. Sowing Time: ", true),
      _buildTextSpan(" June to July.\n"),
      _buildTextSpan("4. Irrigation: ", true),
      _buildTextSpan("  Continuous flooding or regular watering.\n"),
      _buildTextSpan("5. Harvesting: ", true),
      _buildTextSpan("  3 to 6 months after sowing, depending on the variety."),
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

