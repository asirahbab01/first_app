import 'package:flutter/material.dart';

import 'mango-disease_solve/anthrac.dart';
import 'mango-disease_solve/dieback.dart';
import 'mango-disease_solve/gallmidge.dart';
import 'mango-disease_solve/mildew.dart';
import 'mango-disease_solve/rust.dart';
import 'mango-disease_solve/sooty.dart';

class MangoDetailPage extends StatelessWidget {
  const MangoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> problems = [
      {
        'title': 'Problem-1: Anthracnose',
        'description': 'Anthracnose is a fungal disease that affects young leaves and shoots, causing dark, sunken lesions.',
      },
      {
        'title': 'Problem-2: Powdery Mildew',
        'description': 'Powdery mildew is characterized by white, powdery spots on leaves and young fruit. It is caused by the fungus Oidium mangiferae.',
      },
      {
        'title': 'Problem-3: Red Rust',
        'description': 'Red rust appears as orange-red, raised spots on the upper surface of leaves. It is caused by the algae Cephaleuros virescens.',
      },
      {
        'title': 'Problem-4: Dieback',
        'description': 'Dieback is a condition where twigs and branches die from the tips inward, caused by fungal infection.',
      },
      {
        'title': 'Problem-5: Gall Midge',
        'description': 'Gall midge causes the formation of galls on leaves and shoots, leading to deformation and stunted growth.',
      },
      {
        'title': 'Problem-6: Sooty Mold',
        'description': 'Sooty mold is a fungal disease that appears as a black, soot-like coating on leaves, usually growing on honeydew excreted by insects.',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mango Leaves Diseases', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          Image.asset(
            'assets/services/crops/Mango-anthrac.png',
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
        case 'Problem-1: Anthracnose':
          return const AnthracnoseSolutionPage();
        case 'Problem-2: Powdery Mildew':
          return const PowderyMildewSolutionPage();
        case 'Problem-3: Red Rust':
          return const RedRustSolutionPage();
        case 'Problem-4: Dieback':
          return const DiebackSolutionPage();
        case 'Problem-5: Gall Midge':
          return const GallMidgeSolutionPage();
        case 'Problem-6: Sooty Mold':
          return const SootyMoldSolutionPage();
        default:
          return const MangoDetailPage();
      }
    }
