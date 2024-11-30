import 'package:flutter/material.dart';
import 'region.dart';

class CropWeatherCalendarPage extends StatelessWidget {
  const CropWeatherCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> crops = [
      {'name': 'Banana', 'image': 'assets/crops/banana.png'},
      {'name': 'Brinjal', 'image': 'assets/crops/brinjal.png'},
      {'name': 'Cotton', 'image': 'assets/crops/cotton.png'},
      {'name': 'Green gram', 'image': 'assets/crops/gram.png'},
      {'name': 'Potato', 'image': 'assets/crops/potato.png'},
      {'name': 'Onion', 'image': 'assets/crops/onion.png'},
      {'name': 'Jujube', 'image': 'assets/crops/gram.png'},
      {'name': 'Jute', 'image': 'assets/crops/potato.png'},
      {'name': 'Lentil', 'image': 'assets/crops/lentil.png'},
      {'name': 'Mustard', 'image': 'assets/crops/gram.png'},
      {'name': 'Pointed Gourd', 'image': 'assets/crops/potato.png'},
      {'name': 'Maize (Rabi)', 'image': 'assets/crops/onion.png'},
      {'name': 'Pumpkin', 'image': 'assets/crops/pumpkin.png'},
      {'name': 'Tomato', 'image': 'assets/crops/tomato.png'},
      {'name': 'Sugarcane', 'image': 'assets/crops/sugarcane.png'},
      // Add all other crops here
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CROP WEATHER CALENDAR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.8,
        ),
        itemCount: crops.length,
        itemBuilder: (context, index) {
          return CropCard(
            name: crops[index]['name']!,
            image: crops[index]['image']!,
          );
        },
      ),
    );
  }
}

class CropCard extends StatelessWidget {
  final String name;
  final String image;

  const CropCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegionPage(cropName: name),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(image, height: 80, width: 80, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            Flexible(
              child: Text(
                name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
