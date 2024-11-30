import 'package:flutter/material.dart';

import '../../widgets/worker_list.dart';

class RangpurDivisionPage extends StatelessWidget {
  const RangpurDivisionPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hire Workers',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RANGPUR DIVISION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dinajpur, Gaibandha, Kurigram, Lalmonirhat, Nilphamari,Panchagarh, Rangpur, Thakurgaon',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRegionButton(context, 'Dinajpur', const DinajpurRegionPage()),
                  _buildRegionButton(context, 'Gaibandha', const GaibandhaRegionPage()),
                  _buildRegionButton(context, 'Kurigram', const KurigramRegionPage()),
                  _buildRegionButton(context, 'Lalmonirhat', const LalmonirhatRegionPage()),
                  _buildRegionButton(context, 'Nilphamari', const NilphamariRegionPage()),
                  _buildRegionButton(context, 'Panchagarh', const PanchagarhRegionPage()),
                  _buildRegionButton(context, 'Rangpur', const RangpurRegionPage()),
                  _buildRegionButton(context, 'Thakurgaon', const ThakurgaonRegionPage()),
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
class DinajpurRegionPage extends StatelessWidget {
  const DinajpurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Dinajpur',
    );
  }
}

class GaibandhaRegionPage extends StatelessWidget {
  const GaibandhaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Gaibandha',
    );
  }
}



class KurigramRegionPage extends StatelessWidget {
  const KurigramRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Kurigram',
    );
  }
}

class LalmonirhatRegionPage extends StatelessWidget {
  const LalmonirhatRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Lalmonirhat',
    );
  }
}

class NilphamariRegionPage extends StatelessWidget {
  const NilphamariRegionPage({super.key});

  @override
    Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Nilphamari',
    );
  }
}

class PanchagarhRegionPage extends StatelessWidget {
  const PanchagarhRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Panchagarh',
    );
  }
}

class RangpurRegionPage extends StatelessWidget {
  const RangpurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Rangpur',
    );
  }
}

class ThakurgaonRegionPage extends StatelessWidget {
  const ThakurgaonRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Thakurgaon',
    );
  }
}