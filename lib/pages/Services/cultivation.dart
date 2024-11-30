import 'package:first_app/pages/cult-details/jackfruit_cultivation_details.dart';
import 'package:first_app/pages/cult-details/jute_cultivation_details.dart';
import 'package:first_app/pages/cult-details/litchi_cultivation_details.dart';
import 'package:first_app/pages/cult-details/maize_cultivation_details.dart';
import 'package:first_app/pages/cult-details/mango_cultivation_details.dart';
import 'package:first_app/pages/cult-details/peas_cultivation_details.dart';
import 'package:first_app/pages/cult-details/rice_cultivation_details.dart';
import 'package:first_app/pages/cult-details/wheat_cultivation_details.dart';
import 'package:first_app/pages/cult-details/tomato_cultivation_details.dart'; // Add detail pages
import 'package:first_app/pages/cult-details/potato_cultivation_details.dart';
import 'package:first_app/pages/cult-details/carrot_cultivation_details.dart';
import 'package:first_app/pages/cult-details/rose_cultivation_details.dart';
import 'package:first_app/pages/cult-details/lily_cultivation_details.dart';
import 'package:first_app/pages/cult-details/tulip_cultivation_details.dart';
import 'package:first_app/pages/cult-details/apple_cultivation_details.dart';
import 'package:first_app/pages/cult-details/banana_cultivation_details.dart';
import 'package:first_app/pages/cult-details/grapes_cultivation_details.dart';
import 'package:flutter/material.dart';

class CultProcess extends StatelessWidget {
  const CultProcess({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> crops = [
      {
        'title': 'Rice Cultivation',
        'description': 'Bangladesh has a chiefly an agrarian economy where rice is...',
        'image': 'assets/services/crops/rice-cul.png',
      },
      {
        'title': 'Wheat Cultivation',
        'description': 'The wheat crop requires a well-pulverized but compact seed...',
        'image': 'assets/services/crops/wheat-cul.png',
      },
      {
        'title': 'Jute Cultivation',
        'description': 'Jute is a rainy season crop, sown from March to May according to...',
        'image': 'assets/services/crops/jute-cul.png',
      },
      {
        'title': 'Maize Cultivation',
        'description': 'Maize is a tropical plant which prefers warm humid weather...',
        'image': 'assets/services/crops/maize-cul.png',
      },
      {
        'title': 'Peas Farming',
        'description': 'The green peas are usually sown by broadcasting method or...',
        'image': 'assets/services/crops/peas-cul.png',
      },
    ];

    final List<Map<String, String>> vegetables = [
      {
        'title': 'Tomato Cultivation',
        'description': 'Tomatoes are widely grown in tropical regions...',
        'image': 'assets/services/crops/tomato.png',
      },
      {
        'title': 'Potato Cultivation',
        'description': 'Potatoes are a staple food in many parts of the world...',
        'image': 'assets/services/crops/potato-cul.png',
      },
      {
        'title': 'Carrot Cultivation',
        'description': 'Carrots grow best in cool climates...',
        'image': 'assets/services/crops/carrot-cul.png',
      },
    ];

    final List<Map<String, String>> flowers = [
      {
        'title': 'Rose Cultivation',
        'description': 'Roses are among the most popular flowers...',
        'image': 'assets/services/crops/rose-cul.png',
      },
      {
        'title': 'Lily Cultivation',
        'description': 'Lilies are a group of flowering plants...',
        'image': 'assets/services/crops/lily-cul.png',
      },
      {
        'title': 'Tulip Cultivation',
        'description': 'Tulips are spring-blooming perennials...',
        'image': 'assets/services/crops/tulip-cul.png',
      },
    ];

    final List<Map<String, String>> fruits = [
      {
        'title': 'Apple Cultivation',
        'description': 'Apples are one of the most widely grown fruits...',
        'image': 'assets/services/crops/apple-cul.png',
      },
      {
        'title': 'Banana Cultivation',
        'description': 'Bananas are tropical plants that thrive in...',
        'image': 'assets/services/crops/banana-cul.png',
      },
      {
        'title': 'Grape Cultivation',
        'description': 'Grapes are grown in clusters and can be eaten...',
        'image': 'assets/services/crops/grape-cul.png',
      },
      {
        'title': 'Mango Cultivation',
        'description': "Mango is Bangladesh's main seasonal fruit,...",
        'image': 'assets/services/crops/mango-cul.png',
      },
      {
        'title': 'Jackfruit Cultivation',
        'description': 'Jackfruit can be grown on a wide variety of soils but...',
        'image': 'assets/services/crops/jackfruit-cul.png',
      },
      {
        'title': 'Litchi Cultivation',
        'description': 'Lychee is mainly cultivated in the backyard (2-3 plants),...',
        'image': 'assets/services/crops/litchi-cul.png',
      },
    ];

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cultivation Process', style: TextStyle(fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Crops'),
              Tab(text: 'Vegetables'),
              Tab(text: 'Flowers'),
              Tab(text: 'Fruits'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(crops, context),
            buildListView(vegetables, context),
            buildListView(flowers, context),
            buildListView(fruits, context),
          ],
        ),
      ),
    );
  }

  Widget buildListView(List<Map<String, String>> items, BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    items[index]['image']!,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index]['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        items[index]['description']!,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8.0),
                      ElevatedButton(
                        onPressed: () {
                          navigateToDetailsPage(context, items[index]['title']!);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'Read Details',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateToDetailsPage(BuildContext context, String title) {
    if (title == 'Rice Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RiceCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Wheat Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WheatCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Jute Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const JuteCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Maize Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MaizeCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Peas Farming') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PeasFarmingDetailsPage(),
        ),
      );
    } else if (title == 'Tomato Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TomatoCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Potato Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PotatoCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Carrot Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CarrotCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Rose Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RoseCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Lily Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LilyCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Tulip Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TulipCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Apple Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AppleCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Banana Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BananaCultivationDetailsPage(),
        ),
      );
    } else if (title == 'Mango Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MangoCultivationDetailsPage(),
        ),
      );
    }
    else if (title == 'Jackfruit Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const JackfruitCultivationDetailsPage(),
        ),
      );
    }
    else if (title == 'Grape Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const GrapeCultivationDetailsPage(),
        ),
      );
    }
    else if (title == 'Litchi Cultivation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LitchiCultivationDetailsPage(),
        ),
      );
    }
  }
}
