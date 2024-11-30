import 'package:flutter/material.dart';
import '../../widgets/worker_list.dart';

class KhulnaDivisionPage extends StatelessWidget {
  const KhulnaDivisionPage({super.key});

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
              'KHULNA DIVISION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Bagerhat, Chuadanga, Jashore, Jhenaidah, Khulna, Kushtia, Magura, Meherpur, Narail, Satkhira.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRegionButton(
                      context, 'Bagerhat', const BagerhatRegionPage()),
                  _buildRegionButton(
                      context, 'Chuadanga', const ChuadangaRegionPage()),
                  _buildRegionButton(
                      context, 'Jashore', const JashoreRegionPage()),
                  _buildRegionButton(
                      context, 'Jhenaidah', const JhenaidahRegionPage()),
                  _buildRegionButton(
                      context, 'Khulna', const KhulnaRegionPage()),
                  _buildRegionButton(
                      context, 'Kushtia', const KushtiaRegionPage()),
                  _buildRegionButton(
                      context, 'Magura', const MaguraRegionPage()),
                  _buildRegionButton(
                      context, 'Meherpur', const MeherpurRegionPage()),
                  _buildRegionButton(
                      context, 'Narail', const NarailRegionPage()),
                  _buildRegionButton(
                      context, 'Satkhira', const SatkhiraRegionPage()),
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
class BagerhatRegionPage extends StatelessWidget {
  const BagerhatRegionPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Bagerhat',
    );
  }
}

class ChuadangaRegionPage extends StatelessWidget {
  const ChuadangaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Chuadanga',
    );
  }
}

class JashoreRegionPage extends StatelessWidget {
  const JashoreRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Jashore',
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

class KhulnaRegionPage extends StatelessWidget {
  const KhulnaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Khulna',
    );
  }
}

class KushtiaRegionPage extends StatelessWidget {
  const KushtiaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Kushtia',
    );
  }
}

class MaguraRegionPage extends StatelessWidget {
  const MaguraRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Magura',
    );
  }
}

class MeherpurRegionPage extends StatelessWidget {
  const MeherpurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Meherpur',
    );
  }
}

class NarailRegionPage extends StatelessWidget {
  const NarailRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Narail',
    );
  }
}

class SatkhiraRegionPage extends StatelessWidget {
  const SatkhiraRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Satkhira',
    );
  }
}
