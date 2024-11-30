import 'package:flutter/material.dart';

import '../diseases-details/mangodis.dart';
import '../diseases-details/riceblastpage.dart';
import '../diseases-details/carrotcavityspot.dart';
import '../diseases-details/graperot.dart';
import '../diseases-details/potatomosaic.dart';
import '../diseases-details/tomatomold.dart';

class CropDiseaseSolutionsPage extends StatelessWidget {
  const CropDiseaseSolutionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> diseases = [
      {
        'name': 'Diseases of paddy',
        'description':
            'Rice Blast is a fungal disease caused by Pyricularia oryzae...',
        'image': 'assets/services/crops/Rice-blast.jpeg'
      },
      {
        'name': 'Carrot cavity spot',
        'description':
            'Cavity spot is a problem on carrots and is characterized by elliptical...',
        'image': 'assets/services/crops/cavity-spot.png'
      },
      {
        'name': 'Grape bunch rot',
        'description':
            'Leaves, flowers, and green or ripe fruit on or near the soil in the...',
        'image': 'assets/services/crops/grape-rot.jpg'
      },
      {
        'name': 'Mango leaves diseases',
        'description': 'Mango leaves can suffer from various diseases including anthracnose...',
        'image': 'assets/services/crops/Mango-anthrac.png'
      },
      {
        'name': 'Potato Mosaic viruses',
        'description':
            'Mosaic viruses that infect potatoes are transmitted by aphids. They...',
        'image': 'assets/services/crops/mosaic-dis.png'
      },
      {
        'name': 'Black mold on tomato',
        'description':
            'Black mold is characterized by obvious lesions that appear on...',
        'image': 'assets/services/crops/tomato-mold.jpeg'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Crop Diseases',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(diseases[index]['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          diseases[index]['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          diseases[index]['description']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            switch (diseases[index]['name']) {
                              case 'Diseases of paddy':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PaddyDetailPage()));
                                break;
                              case 'Carrot cavity spot':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CarrotDetailPage()));
                                break;
                              case 'Grape bunch rot':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const GrapeDetailPage()));
                                break;
                              case 'Mango leaves diseases':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MangoDetailPage()));
                                break;
                              case 'Potato Mosaic viruses':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PotatoDetailPage()));
                                break;
                              case 'Black mold on tomato':
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TomatoDetailPage()));
                                break;
                            }
                          },
                          child: const Text('Read Details'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
