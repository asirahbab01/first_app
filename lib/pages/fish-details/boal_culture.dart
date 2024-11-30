import 'package:flutter/material.dart';

class BoalCultureDetailsPage extends StatelessWidget {
  const BoalCultureDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boal Culture'),
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
                'Boal Culture in Bangladesh',
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
                    image: AssetImage('assets/fish/boal_culture.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Boal, also known as Wallago attu, is a large catfish species native to the rivers and freshwater bodies of Bangladesh. It is known for its size and meat quality.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Boal Culture in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Boal culture is still developing in Bangladesh, with many challenges in breeding and maintaining the species in captivity. However, wild capture and selective farming are gaining popularity.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ideal Condition for Boal Culture',
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
                        " Warm and tropical climate with temperatures between 25°C and 30°C.\n"),
                    _buildTextSpan("2. Water Quality: ", true),
                    _buildTextSpan(" Freshwater bodies with good oxygenation and a pH of 6.5 to 7.5.\n"),
                    _buildTextSpan("3. Feeding: ", true),
                    _buildTextSpan(" Carnivorous diet including smaller fish and high-protein feed.\n"),
                    _buildTextSpan("4. Stocking Density: ", true),
                    _buildTextSpan(" Lower density to allow space for growth and movement.\n"),
                    _buildTextSpan("5. Harvesting: ", true),
                    _buildTextSpan(
                        " Harvested after 1-2 years depending on the growth rate and market demand."),
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
