import 'package:flutter/material.dart';

class HilshaCultureDetailsPage extends StatelessWidget {
  const HilshaCultureDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hilsha Culture'),
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
                'Hilsha Culture in Bangladesh',
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
                    image: AssetImage('assets/fish/Hilsha_culture.png'), // Replace with your image URL
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Hilsha, also known as Tenualosa ilisha, is Bangladesh’s national fish and is highly sought after for its unique taste. It primarily thrives in rivers and estuaries.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Present Status of Hilsha Culture in Bangladesh',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Hilsha is mostly captured from wild stocks in rivers like the Padma and Meghna. Efforts are ongoing to regulate fishing to prevent overexploitation and to explore possibilities of farming Hilsha. Hilsa production has increased by 78% in last 11 years from 2007-08 in Bangladesh due to various conservation measures taken by the Government. Bangladesh is the world top hilsa producing country and accounts for about 75% of the world hilsa landings. ',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ideal Condition for Hilsha Culture',
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
                        " Estuarine and riverine environments with moderate temperatures around 24°C to 28°C.\n"),
                    _buildTextSpan("2. Water Quality: ", true),
                    _buildTextSpan(
                        " Brackish water with a salinity range of 10-15 ppt and good oxygen levels.\n"),
                    _buildTextSpan("3. Feeding: ", true),
                    _buildTextSpan(
                        " Plankton-based diet along with organic matter from river sediments.\n"),
                    _buildTextSpan("4. Stocking Density: ", true),
                    _buildTextSpan(
                        " Naturally occurring fish stocks in rivers, with controlled fishing seasons.\n"),
                    _buildTextSpan("5. Harvesting: ", true),
                    _buildTextSpan(
                        " Harvested after 1-2 years when they migrate to rivers for breeding."),
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
