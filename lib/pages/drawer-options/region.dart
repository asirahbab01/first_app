import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class RegionPage extends StatelessWidget {
  final String cropName;

  const RegionPage({super.key, required this.cropName});

  void _showPdf(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerPage(url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> regions = [
      'Barishal',
      'Bogura',
      'Dhaka',
      'Jessore',
      'Mymensingh',
      'Cumilla',
      'Dinajpur',
      'Faridpur',
      'Khulna',
      'Rajshahi',
      'Rangpur'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('$cropName - Crop Weather Calendar'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: regions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(color: Colors.green),
              ),
              onPressed: () async {
                final querySnapshot = await FirebaseFirestore.instance
                    .collection('crop_calendars')
                    .where('crop', isEqualTo: cropName)
                    .where('region', isEqualTo: regions[index])
                    .get();

                if (querySnapshot.docs.isNotEmpty) {
                  final doc = querySnapshot.docs.first;
                  final url = doc['url'];
                  _showPdf(context, url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No calendar found for this region'),backgroundColor: Colors.redAccent, behavior: SnackBarBehavior.floating,),
                  );
                }
              },
              child: Text(
                regions[index],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PDFViewerPage extends StatelessWidget {
  final String url;

  const PDFViewerPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Calendar',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
      ),
      body: const PDF().cachedFromUrl(
        url,
        placeholder: (progress) => Center(child: CircularProgressIndicator(value: progress)),
        errorWidget: (error) => Center(child: Text(error.toString())),
      ),
    );
  }
}
