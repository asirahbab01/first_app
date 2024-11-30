import 'package:first_app/pages/diseases-details/rice-disease_solve.dart/brownspot.dart';
import 'package:first_app/pages/diseases-details/rice-disease_solve.dart/riceblast.dart';
import 'package:first_app/pages/diseases-details/rice-disease_solve.dart/sheathblight.dart';
import 'package:flutter/material.dart';

class PaddyDetailPage extends StatelessWidget {
  const PaddyDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> problems = [
      {
        'title': 'Problem-1: Rice Blast',
        'description':
            'Rice Blast is a fungal disease caused by Pyricularia oryzae. Symptoms include elliptical lesions on the leaves with gray or white centers and brown borders.',
      },
      {
        'title': 'Problem-2: Sheath Blight',
        'description':
            'Sheath Blight is caused by the fungus Rhizoctonia solani, leading to lesions on the leaf sheath near the waterline.',
      },
      {
        'title': 'Problem-3: Brown Spot',
        'description':
            'Brown Spot is caused by the fungus Bipolaris oryzae and results in brown lesions on leaves, reducing photosynthesis and yield.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Diseases of Paddy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/services/crops/Rice-blast.jpeg',
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
                                builder: (context) =>
                                    _navigateToSolution(problem['title']!),
                              ),
                            ); // Implement solution navigation
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
    case 'Problem-1: Rice Blast':
      return const RiceBlastSolutionPage();
    case 'Problem-2: Sheath Blight':
      return const SheathBlightSolutionPage();
    case 'Problem-3: Brown Spot':
      return const BrownSpotSolutionPage();
    default:
      return const PaddyDetailPage();
  }
}
