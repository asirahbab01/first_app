import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/motto.png'),
                backgroundColor:
                    Colors.transparent, // Add your company logo here
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Our Company',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Who We Are',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            const Text(
              'We are a leading company in the agro-services industry, dedicated to providing top-notch solutions for farmers and agricultural professionals. Our mission is to innovate and deliver sustainable solutions that enhance productivity and efficiency in agriculture.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Our Vision',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Our vision is to be the foremost provider of agro-services worldwide, continually pushing the boundaries of technology and service to empower farmers and agricultural stakeholders.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Our Values',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Integrity, Innovation, Sustainability, and Customer Focus are the core values that drive us. We believe in doing business with honesty, striving for continuous improvement, and putting our customers at the heart of everything we do.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Meet the Team',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            const Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                TeamMember(
                  name: 'Sk Saier Islam',
                  position: 'Chief Executive Officer',
                  imagePath: 'assets/team/Saier.jpeg',
                ),
                TeamMember(
                  name: 'Akkhoy Areng Joy',
                  position: 'Accounts Manager',
                  imagePath: 'assets/team/Joy.jpeg',
                ),
                TeamMember(
                  name: 'Arafatzaman Miraj',
                  position: 'HR Head',
                  imagePath: 'assets/team/miraj.jpeg',
                ),
                TeamMember(
                  name: 'Asir Ahbab',
                  position: 'Sales Manager',
                  imagePath: 'assets/team/Asir.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TeamMember extends StatelessWidget {
  final String name;
  final String position;
  final String imagePath;

  const TeamMember({
    super.key,
    required this.name,
    required this.position,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          position,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
