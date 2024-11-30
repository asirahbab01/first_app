import 'package:flutter/material.dart';

import '../../widgets/worker_list.dart';

class ChittagongDivisionPage extends StatelessWidget {
  const ChittagongDivisionPage({super.key});

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
              'CHITTAGONG DIVISION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Bandarban, Brahmanbaria, Chandpur, Chattogram, Cumilla, Cox\'s Bazar, Feni, Khagrachari, Lakshmipur, Noakhali, Rangamati.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRegionButton(context, 'Bandarban', const BandarbanRegionPage()),
                  _buildRegionButton(context, 'Brahmanbaria', const BrahmanbariaRegionPage()),
                  _buildRegionButton(context, 'Chandpur', const ChandpurRegionPage()),
                  _buildRegionButton(context, 'Chattogram', const ChattogramRegionPage()),
                  _buildRegionButton(context, 'Cumilla', const CumillaRegionPage()),
                  _buildRegionButton(context, 'Cox\'s Bazar', const CoxRegionPage()),
                  _buildRegionButton(context, 'Feni', const FeniRegionPage()),
                  _buildRegionButton(context, 'Khagrachari', const KhagrachariRegionPage()),
                  _buildRegionButton(context, 'Lakshmipur', const LakshmipurRegionPage()),
                  _buildRegionButton(context, 'Noakhali', const NoakhaliRegionPage()),
                  _buildRegionButton(context, 'Rangamati', const RangamatiRegionPage()),
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
class BandarbanRegionPage extends StatelessWidget {
  const BandarbanRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Bandarban',
    );
  }
}

class BrahmanbariaRegionPage extends StatelessWidget {
  const BrahmanbariaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Brahmanbaria',
    );
  }
}



class ChandpurRegionPage extends StatelessWidget {
  const ChandpurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Chandpur',
    );
  }
}

class ChattogramRegionPage extends StatelessWidget {
  const ChattogramRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Chattogram',
    );
  }
}

class CumillaRegionPage extends StatelessWidget {
  const CumillaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Cumilla',
    );
  }
}

class CoxRegionPage extends StatelessWidget {
  const CoxRegionPage({super.key});

  @override
    Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Cox\'s Bazar',
    );
  }
}

class FeniRegionPage extends StatelessWidget {
  const FeniRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Feni',
    );
  }
}

class KhagrachariRegionPage extends StatelessWidget {
  const KhagrachariRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Khagrachari',
    );
  }
}

class LakshmipurRegionPage extends StatelessWidget {
  const LakshmipurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Lakshmipur',
    );
  }
}


class NoakhaliRegionPage extends StatelessWidget {
  const NoakhaliRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Noakhali',
    );
  }
}

class RangamatiRegionPage extends StatelessWidget {
  const RangamatiRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Rangamati',
    );
  }
}
