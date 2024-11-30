import 'package:flutter/material.dart';
import '../../widgets/worker_list.dart';
//import '../../models/worker_model.dart';

class DhakaDivisionPage extends StatelessWidget {
  const DhakaDivisionPage({super.key});

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
              'DHAKA DIVISION',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dhaka, Faridpur, Gazipur, Gopalganj, Kishoreganj, Madaripur, Manikganj, Munshiganj, Narayanganj, Narsingdi, Rajbari, Shariatpur and Tangail.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildRegionButton(context, 'Dhaka', const DhakaRegionPage()),
                  _buildRegionButton(context, 'Faridpur', const FaridpurRegionPage()),
                  _buildRegionButton(context, 'Gazipur', const GazipurRegionPage()),
                  _buildRegionButton(context, 'Gopalganj', const GopalganjRegionPage()),
                  _buildRegionButton(context, 'Kishoreganj', const KishoreganjRegionPage()),
                  _buildRegionButton(context, 'Madaripur', const MadaripurRegionPage()),
                  _buildRegionButton(context, 'Manikganj', const ManikganjRegionPage()),
                  _buildRegionButton(context, 'Munshiganj', const MunshiganjRegionPage()),
                  _buildRegionButton(context, 'Narayanganj', const NarayanganjRegionPage()),
                  _buildRegionButton(context, 'Narsingdi', const NarsingdiRegionPage()),
                  _buildRegionButton(context, 'Rajbari', const RajbariRegionPage()),
                  _buildRegionButton(context, 'Shariatpur', const ShariatpurRegionPage()),
                  _buildRegionButton(context, 'Tangail', const TangailRegionPage()),
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
class DhakaRegionPage extends StatelessWidget {
  const DhakaRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Dhaka',
    );
  }
}

class FaridpurRegionPage extends StatelessWidget {
  const FaridpurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Faridpur',
    );
  }
}



class GazipurRegionPage extends StatelessWidget {
  const GazipurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Gazipur',
    );
  }
}

class GopalganjRegionPage extends StatelessWidget {
  const GopalganjRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Gopalganj',
    );
  }
}

class KishoreganjRegionPage extends StatelessWidget {
  const KishoreganjRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Kishoreganj',
    );
  }
}

class MadaripurRegionPage extends StatelessWidget {
  const MadaripurRegionPage({super.key});

  @override
    Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Madaripur',
    );
  }
}

class ManikganjRegionPage extends StatelessWidget {
  const ManikganjRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Manikganj',
    );
  }
}

class MunshiganjRegionPage extends StatelessWidget {
  const MunshiganjRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Munshiganj',
    );
  }
}

class NarayanganjRegionPage extends StatelessWidget {
  const NarayanganjRegionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const WorkerListPage(
      region: 'Narayanganj',
    );
  }
}


class NarsingdiRegionPage extends StatelessWidget {
  const NarsingdiRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Narsingdi',
    );
  }
}



class ShariatpurRegionPage extends StatelessWidget {
  const ShariatpurRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Shariatpur',
    );
  }
}

class TangailRegionPage extends StatelessWidget {
  const TangailRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Tangail',
    );
  }
}


class RajbariRegionPage extends StatelessWidget {
  const RajbariRegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const WorkerListPage(
      region: 'Rajbari',
    );
  }
}
