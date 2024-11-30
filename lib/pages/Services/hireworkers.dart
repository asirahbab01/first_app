import 'package:flutter/material.dart';

import '../division-details/brsh_division.dart';
import '../division-details/ctg_division.dart';
import '../division-details/dhk_division.dart';
import '../division-details/khn_division.dart';
import '../division-details/mym_division.dart';
import '../division-details/raj_division.dart';
import '../division-details/rang_division.dart';
import '../division-details/syl_division.dart';

class HireWorkersPage extends StatelessWidget {
  const HireWorkersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hire Workers',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
      ),
      body: Container(
        color: const Color.fromARGB(255, 219, 216, 216), // Light ash background color
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Welcome to our agricultural worker selection tool! '
                    'Easily find and hire skilled workers based on specific areas '
                    'to meet your agricultural needs. Choose an area, select workers '
                    'and contact with them through our platform. Start now and streamline '
                    'your hiring process!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19),
                  ),
                  SizedBox(height: 7),
                ],
              ),
            ),
            Container(
              color: Colors.lightGreen,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: const Center(
                child: Text(
                  'SELECT YOUR AREA',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(16),
                children: [
                  _buildGridItem(context, 'Dhaka', 'assets/map/Dhaka.png', const DhakaDivisionPage()),
                  _buildGridItem(context, 'Chattogram', 'assets/map/Chattogram.png', const ChittagongDivisionPage()),
                  _buildGridItem(context, 'Sylhet', 'assets/map/Sylhet.png', const SylhetDivisionPage()),
                  _buildGridItem(context, 'Rangpur', 'assets/map/Rangpur.png', const RangpurDivisionPage()),
                  _buildGridItem(context, 'Mymensingh', 'assets/map/Mymensingh.png', const MymensinghDivisionPage()),
                  _buildGridItem(context, 'Khulna', 'assets/map/Khulna.png', const KhulnaDivisionPage()),
                  _buildGridItem(context, 'Rajshahi', 'assets/map/Rajshahi.png', const RajshahiDivisionPage()),
                  _buildGridItem(context, 'Barishal', 'assets/map/Barishal.png', const BarishalDivisionPage()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, String imagePath, Widget targetPage) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => targetPage,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

