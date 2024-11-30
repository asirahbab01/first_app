import 'package:flutter/material.dart';
import '../../widgets/worker_list.dart';

class RajshahiDivisionPage extends StatelessWidget {
  const RajshahiDivisionPage({super.key});

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
              'RAJSHAHI DIVISION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Bogura, Joypurhat, Naogaon, Natore, Chapainawabganj, Pabna, Rajshahi, Sirajganj.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRegionButton(
                      context, 'Bogura', const BoguraRegionPage()),
                  _buildRegionButton(
                      context, 'Joypurhat', const JoypurhatRegionPage()),
                  _buildRegionButton(
                      context, 'Naogaon', const NaogaonRegionPage()),
                  _buildRegionButton(
                      context, 'Chapainawabganj', const ChapainawabganjRegionPage()),
                  _buildRegionButton(
                      context, 'Natore', const NatoreRegionPage()),
                  _buildRegionButton(
                      context, 'Pabna', const PabnaRegionPage()),
                  _buildRegionButton(
                      context, 'Rajshahi', const RajshahiRegionPage()),
                  _buildRegionButton(
                      context, 'Sirajganj', const SirajganjRegionPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionButton(
      BuildContext context, String region, Widget targetPage) {
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
class BoguraRegionPage extends StatelessWidget {
  const BoguraRegionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Bogura',
    );
  }
}

class JoypurhatRegionPage extends StatelessWidget {
  const JoypurhatRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Joypurhat',
    );
  }
}

class NaogaonRegionPage extends StatelessWidget {
  const NaogaonRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Naogaon',
    );
  }
}

class JhenaidahRegionPage extends StatelessWidget {
  const JhenaidahRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Jhenaidah',
    );
  }
}

class ChapainawabganjRegionPage extends StatelessWidget {
  const ChapainawabganjRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Chapainawabganj',
    );
  }
}

class NatoreRegionPage extends StatelessWidget {
  const NatoreRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Natore',
    );
  }
}

class PabnaRegionPage extends StatelessWidget {
  const PabnaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Pabna',
    );
  }
}

class RajshahiRegionPage extends StatelessWidget {
  const RajshahiRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Rajshahi',
    );
  }
}

class SirajganjRegionPage extends StatelessWidget {
  const SirajganjRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Narail',
    );
  }
}
