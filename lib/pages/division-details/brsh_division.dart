import 'package:flutter/material.dart';
import '../../widgets/worker_list.dart';

class BarishalDivisionPage extends StatelessWidget {
  const BarishalDivisionPage({super.key});

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
              'BARISHAL DIVISION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Barguna, Barishal , Bhola, Jhalokathi,  Patuakhali,  Pirojpur.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRegionButton(
                      context, 'Barguna', const BargunaRegionPage()),
                  _buildRegionButton(
                      context, 'Barishal ', const BarishalRegionPage()),
                  _buildRegionButton(
                      context, 'Bhola', const BholaRegionPage()),
                  _buildRegionButton(
                      context, 'Jhalokathi', const JhalokathiRegionPage()),
                  _buildRegionButton(
                      context, ' Patuakhali', const  PatuakhaliRegionPage()),
                  _buildRegionButton(
                      context, ' Pirojpur', const  PirojpurRegionPage()),
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
class BargunaRegionPage extends StatelessWidget {
  const BargunaRegionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Barguna',
    );
  }
}

class BarishalRegionPage extends StatelessWidget {
  const BarishalRegionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Barishal',
    );
  }
}

class BholaRegionPage extends StatelessWidget {
  const BholaRegionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Bhola',
    );
  }
}

class JhalokathiRegionPage extends StatelessWidget {
const JhalokathiRegionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Jhalokathi',
    );
  }
}

class  PirojpurRegionPage extends StatelessWidget {
  const  PirojpurRegionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Pirojpur',
    );
  }
}

class  PatuakhaliRegionPage extends StatelessWidget {
  const  PatuakhaliRegionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Patuakhali',
    );
  }
}





