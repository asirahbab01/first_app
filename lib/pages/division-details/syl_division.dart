import 'package:flutter/material.dart';
import '../../widgets/worker_list.dart';
//import '../../models/worker_model.dart';

class SylhetDivisionPage extends StatelessWidget {
  const SylhetDivisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hire Workers', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SYLHET DIVISION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Habiganj, Moulvibazar, Sunamganj, Sylhet.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRegionButton(context, 'Habiganj', const HabiganjRegionPage()),
                  _buildRegionButton(context, 'Moulvibazar', const MoulvibazarRegionPage()),
                  _buildRegionButton(context, 'Sunamganj', const SunamganjRegionPage()),
                  _buildRegionButton(context, 'Sylhet', const SylhetRegionPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionButton(BuildContext context, String region, Widget targetPage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => targetPage,
            ),
          );
        },
        child: Text(
          region,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

// Placeholder classes for each region's page
class HabiganjRegionPage extends StatelessWidget {
  const HabiganjRegionPage({super.key});
  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Habiganj',
    );
  }
}

class MoulvibazarRegionPage extends StatelessWidget {
  const MoulvibazarRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Moulvibazar',
    );
  }
}

class SunamganjRegionPage extends StatelessWidget {
  const SunamganjRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Sunamganj',
    );
  }
}

class SylhetRegionPage extends StatelessWidget {
  const SylhetRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Sylhet',
    );
  }
}
