import 'package:flutter/material.dart';
import '../../widgets/worker_list.dart';
//import '../../models/worker_model.dart';

class MymensinghDivisionPage extends StatelessWidget {
  const MymensinghDivisionPage({super.key});

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
              'MYMENSINGH DIVISION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Jamalpur, Mymensingh, Netrokona, Sherpur.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRegionButton(context, 'Jamalpur', const JamalpurRegionPage()),
                  _buildRegionButton(context, 'Mymensingh', const MymensinghRegionPage()),
                  _buildRegionButton(context, 'Netrokona', const NetrokonaRegionPage()),
                  _buildRegionButton(context, 'Sherpur', const SherpurRegionPage()),
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
class JamalpurRegionPage extends StatelessWidget {
  const JamalpurRegionPage({super.key});
  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Jamalpur',
    );
  }
}

class MymensinghRegionPage extends StatelessWidget {
  const MymensinghRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Mymensingh',
    );
  }
}

class NetrokonaRegionPage extends StatelessWidget {
  const NetrokonaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Netrokona',

    );
  }
}

class SherpurRegionPage extends StatelessWidget {
  const SherpurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Sherpur',
    );
  }
}