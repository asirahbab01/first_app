import 'package:flutter/material.dart';

import 'grape-disease_solve/botry.dart';
import 'grape-disease_solve/powder.dart';

class GrapeDetailPage extends StatelessWidget {
  const GrapeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> problems = [
      {
        'title': 'Problem-1: Botrytis Bunch Rot',
        'description': 'Botrytis bunch rot is caused by the fungus Botrytis cinerea, which affects grape berries, causing them to become brown and shriveled.',
      },
      {
        'title': 'Problem-2: Powdery Mildew',
        'description': 'Powdery mildew is caused by the fungus Erysiphe necator and appears as white powdery spots on leaves and berries.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grape Bunch Rot',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/services/crops/grape-rot.jpg',
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
        case 'Problem-1: Botrytis Bunch Rot':
          return const BotrytisBunchRotSolutionPage();
        case 'Problem-2: Powdery Mildew':
          return const PowderyMildewGrapeSolutionPage();
        default:
          return const GrapeDetailPage();
      }
    }
