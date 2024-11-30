import 'package:first_app/pages/fish-details/boal_culture.dart';
import 'package:first_app/pages/fish-details/hilsha_culture.dart';
import 'package:first_app/pages/fish-details/tengra_culture.dart';
import 'package:flutter/material.dart';

import 'package:first_app/pages/fish-details/rupchanda_culture.dart';
import 'package:first_app/pages/fish-details/koi_culture.dart';
import 'package:first_app/pages/fish-details/rui_culture.dart';

import '../fish-details/katla_culture.dart';

class FishCulturePage extends StatelessWidget {
  const FishCulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> fishCultures = [
      {
        'title': 'Rui Culture',
        'description': 'Rui is one of the most important species of fish...',
        'image': 'assets/fish/rui_culture.png',
      },
      {
        'title': 'Koi Culture',
        'description': 'Koi fish farming is very popular and profitable...',
        'image': 'assets/fish/koi_culture.jpg',
      },
      {
        'title': 'Rupchanda Culture',
        'description': 'Rupchanda fish culture is gaining popularity...',
        'image': 'assets/fish/rupchanda_culture.png',
      },
      {
        'title': 'Catla Culture',
        'description': 'Catla is a freshwater fish and a major carp in...',
        'image': 'assets/fish/catla_culture.png',
      },
      {
        'title': 'Hilsha Culture',
        'description':
            'Hilsa, also known as Ilish, is the national fish of Bangladesh and has...',
        'image': 'assets/fish/hilsha_culture.png',
      },
      {
        'title': 'Boal Culture',
        'description':
            'A freshwater catfish that\'s native to South and Southeast Asia, and can...',
        'image': 'assets/fish/boal_culture.png',
      },
      {
        'title': 'Tengra Culture',
        'description':
            'Tengra is a popular freshwater fish species in Bangladesh, prized for its delicious taste and ...',
        'image': 'assets/fish/tengra_culture.png',
      },

      // Add more fish cultures as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fish Culture',
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: fishCultures.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      fishCultures[index]['image']!,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fishCultures[index]['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          fishCultures[index]['description']!,
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            navigateToDetailsPage(context, fishCultures[index]['title']!);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              'Read Details',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void navigateToDetailsPage(BuildContext context, String title) {
    if (title == 'Rui Culture') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RuiCultureDetailsPage(),
        ),
      );
    } else if (title == 'Koi Culture') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const KoiCultureDetailsPage(),
        ),
      );
    } else if (title == 'Rupchanda Culture') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RupchandaCultureDetailsPage(),
        ),
      );
    } else if (title == 'Catla Culture') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const KatlaCultureDetailsPage(),
        ),
      );
    }
    else if (title == 'Hilsha Culture') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HilshaCultureDetailsPage(),
        ),
      );
    }
    else if (title == 'Tengra Culture') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TengraCultureDetailsPage(),
        ),
      );
    }
    else if (title == 'Boal Culture') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BoalCultureDetailsPage(),
        ),
      );
    }
    // Add more navigation options for other fish culture details pages
  }
}
