import 'package:first_app/pages/diseases-details/tomato-disease_solve/blackmold.dart';
import 'package:first_app/pages/diseases-details/tomato-disease_solve/lateblight.dart';
import 'package:flutter/material.dart';

class TomatoDetailPage extends StatelessWidget {
  const TomatoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> problems = [
      {
        'title': 'Problem-1: Black Mold',
        'description': 'Black mold is caused by the fungus Alternaria alternata and results in dark, sunken lesions on tomato fruit.',
      },
      {
        'title': 'Problem-2: Late Blight',
        'description': 'Late blight is caused by the oomycete Phytophthora infestans and appears as brown lesions on leaves and stems.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Black Mold on Tomato',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/services/crops/tomato-mold.jpeg',
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
    case 'Problem-1: Black Mold':
      return const BlackMoldSolutionPage();
    case 'Problem-2: Late Blight':
      return const LateBlightSolutionPage();
    default:
      return const TomatoDetailPage();
  }
}
