import 'package:first_app/pages/Services/hireworkers.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'Services/cultivation.dart';
import 'Services/crop_disease_solutions.dart';  // Import the new page
import '../data/services.dart';
import 'Services/fishes.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: services.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index==0){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FishCulturePage(),
                  ),
                );

              }
              else if (index==1){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HireWorkersPage(),
                  ),
                );

              }
              else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CultProcess(),
                  ),
                );
              } else if (index == 3) {  // Assuming Crop Disease Solutions is at index 3
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CropDiseaseSolutionsPage(),
                  ),
                );
              } else {
                // Handle other service clicks if needed
              }
            },
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(services[index].image),
                  fit: BoxFit.cover,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      services[index].name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
