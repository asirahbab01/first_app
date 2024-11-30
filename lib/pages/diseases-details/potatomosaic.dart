import 'package:first_app/pages/diseases-details/potato-disease_solve.dart/leaf_roll.dart';
import 'package:first_app/pages/diseases-details/potato-disease_solve.dart/mosaic.dart';
import 'package:flutter/material.dart';

class PotatoDetailPage extends StatelessWidget {
  const PotatoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> problems = [
      {
        'title': 'Problem-1: Mosaic Virus',
        'description': 'Mosaic viruses are transmitted by aphids and cause mottling, yellowing, and stunted growth in potatoes.',
      },
      {
        'title': 'Problem-2: Potato Leaf Roll Virus',
        'description': 'Potato leaf roll virus is transmitted by aphids and causes upward rolling of leaves and chlorosis.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Potato Mosaic Viruses',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/services/crops/mosaic-dis.png',
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
                            );// Implement solution navigation
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
        case 'Problem-1: Mosaic Virus':
          return const PotatoLeafRollVirusSolutionPage();
        case 'Problem-2: Potato Leaf Roll Virus':
          return const MosaicVirusSolutionPage();
        default:
          return const PotatoDetailPage();
      }
}