import 'package:flutter/material.dart';

import 'carrot-disease_solve/cav_spot.dart';
import 'carrot-disease_solve/leaf_blight.dart';

class CarrotDetailPage extends StatelessWidget {
  const CarrotDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> problems = [
      {
        'title': 'Problem-1: Cavity Spot',
        'description': 'Cavity spot is characterized by elliptical, sunken lesions on the roots. It is caused by several species of the soilborne fungus Pythium.',
      },
      {
        'title': 'Problem-2: Alternaria Leaf Blight',
        'description': 'Alternaria leaf blight is caused by the fungus Alternaria dauci. Symptoms include dark brown to black spots on leaves.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrot Cavity Spot',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/services/crops/cavity-spot.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: problems.map((problem) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          problem['title']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          problem['description']!,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => _navigateToSolution(problem['title']!),
                              ),
                            );
                            // Implement solution navigation
                          },
                          child: const Text('Solution'),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _navigateToSolution(String problemTitle) {
      switch (problemTitle) {
        case 'Problem-1: Cavity Spot':
          return const CavitySpotSolutionPage();
        case 'Problem-2: Alternaria Leaf Blight':
          return const AlternariaLeafBlightSolutionPage();
        default:
          return const CarrotDetailPage();
      }
    }
