import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';

class TensorFlow extends StatefulWidget {
  const TensorFlow({super.key});

  @override
  _TensorFlowState createState() => _TensorFlowState();
}

class _TensorFlowState extends State<TensorFlow> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  File? file;
  List<dynamic>? _recognitions;
  final List<Map<String, String>> diseaseDetails = [];

  // Map to hold descriptions and solutions for each disease
  final Map<String, Map<String, String>> diseaseInfo = {
    "Anthracnose": {
      "description":
          "Mango Anthracnose is a fungal disease caused by Colletotrichum species. It affects leaves, flowers, and fruits, causing dark spots.",
      "solution":
          "Apply copper-based fungicides. Prune affected branches. Improve air circulation by trimming dense foliage."
    },
    "Powdery Mildew": {
      "description":
          "Powdery Mildew causes white, powdery spots on leaves and can reduce fruit yield.",
      "solution":
          "Apply sulfur or neem oil sprays. Remove infected leaves and ensure proper air circulation. Spray the plants with mouthwash to kill powdery mildew spores.  Cut the mango tree branches to keep them short for easy management and air flow."
    },
    "Bacterial Canker": {
      "description":
          "Bacterial Canker causes raised lesions on leaves and fruits, leading to premature fruit drop.",
      "solution":
          "Spray copper-based fungicides to control bacterial canker. Remove and destroy infected plant parts. Plant trees in areas protected from wind. Monitor leaves and fruit for symptoms weekly. Avoid overhead irrigation."
    },
    "Leaf Spot": {
      "description":
          "Leaf Spot appears as small, dark spots on leaves that can expand and cause leaf drop.",
      "solution":
          "Use a fungicide containing chlorothalonil or mancozeb. Remove infected leaves and avoid water splashing on leaves."
    },
    "Gall Midge": {
      "description":
          "Galls are Rounded, blister-like bumps on leaves, buds, shoots, and young fruits that are 2–3 mm in diameter and 0.4–0.7 mm high. More leaf drop than usual. Leaves may have roundish holes.",
      "solution":
          "Plant resistant varieties, maintain sanitation, and properly weed the area. Cover the soil with plastic foil to prevent larvae from dropping to the ground. Don't move infested plants to new areas."
    },
    "Cutting Weevil": {
      "description":
          "The mango leaf-cutting weevil (Deporaus marginatus) is a beetle that attacks mango trees and is a significant pest in tropical Asia. The most obvious sign of infestation is cut leaves on the ground beneath the tree. Infested plants will have stripped shoots that are visible from a distance.",
      "solution":
          "Spray young leaves with insecticides like deltamethrin, fenvalerate, or trichlorphon when they are about 3 cm wide. Collect leaves with eggs on them and dry or burn them.  Remove dead or severely affected branches from the tree."
    },
    "Die Back": {
      "description":
          "Mango dieback is a destructive disease caused by the fungus Lasiodiplodia theobromae. The twigs or branches of the mango tree dry out and die, sometimes killing the entire branch. The leaves of the tree may become necrotic.",
      "solution":
          "Prune infected branches 5-8 cm below the dead area, and remove the pruned branches from the orchard. Use flutriafol as a fungicide against dieback.  Avoid mechanical injuries to the plant, and reduce plant stress from drought and nutritional deficiencies."
    },
    "Sooty Mould": {
      "description":
          "Sooty mold is a fungal disease that affects mango trees and is caused by the secretion of honeydew by insects. It can stunt growth, cause leaves to turn yellow and die early, and reduce the quality of fruit. Common in dense, old orchards with low light intensity.",
      "solution":
          "Wipe the affected leaves with a damp cloth or soap and water solution to soften and remove the mold. Spray a solution of 1 kg of starch or maida boiled in 1 liter of water and diluted to 20 liters. Use neem oil to reduce the growth of the fungus and to ward off the insects that cause it."
    },
    "Humans": {
      "description":
          "They are the best creations of the Almighty Allah. That's why, they are known as Ashraful Makhlukat.Their scientific name is Homo Sapiens.",
      "solution":
          "Nothing to add as humans are always ready to serve the people & other animals as well during the time of their need."
    },
    // Add more diseases here...
  };

  @override
  void initState() {
    super.initState();
    loadModel().then((_) {});
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _image = image;
          file = File(image.path);
        });
        await detectImage(file!);
      }
    } catch (e) {
      //print('Error picking image: $e');
    }
  }

  Future<void> detectImage(File image) async {
    //int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions;
      _updateDiseaseDetails();
    });
    //int endTime = DateTime.now().millisecondsSinceEpoch;
    //print("Inference took ${endTime - startTime}ms");
  }

  void _updateDiseaseDetails() {
    diseaseDetails.clear();

    if (_recognitions != null) {
      for (var result in _recognitions!) {
        String label = result['label'];
        if (diseaseInfo.containsKey(label)) {
          diseaseDetails.add({
            'disease': label,
            'description': diseaseInfo[label]!['description']!,
            'solution': diseaseInfo[label]!['solution']!,
          });
        } else {
          diseaseDetails.add({
            'disease': label,
            'description': "Description not available.",
            'solution': "Solution not available.",
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Wrap the entire column with SingleChildScrollView
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (_image != null)
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Image.file(
                      File(_image!.path),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  )
                else
                  const Text('No image selected'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.gallery),
                      child: const Text('Pick Image from Gallery'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      child: const Text('Take Photo'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (_recognitions != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _recognitions!.map((result) {
                      return Text(
                        "${result['index']}: ${result['label']} (${result['confidence'].toStringAsFixed(2)})",
                        style: const TextStyle(fontSize: 16),
                      );
                    }).toList(),
                  ),
                const SizedBox(height: 20),
                if (diseaseDetails.isNotEmpty)
                  ListView.builder(
                    shrinkWrap:
                        true, // ShrinkWrap allows the ListView to take the space it needs within the scroll view
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable scrolling inside ListView so it integrates with outer scroll
                    itemCount: diseaseDetails.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                diseaseDetails[index]['disease']!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Description:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                diseaseDetails[index]['description']!,
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Solution:",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Text(
                                diseaseDetails[index]['solution']!,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
