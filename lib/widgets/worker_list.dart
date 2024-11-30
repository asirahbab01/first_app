import 'package:flutter/material.dart';
import '../models/worker_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerListPage extends StatefulWidget {
  final String region;

  const WorkerListPage({
    super.key,
    required this.region,
  });

  @override
  _WorkerListPageState createState() => _WorkerListPageState();
}

class _WorkerListPageState extends State<WorkerListPage> {
  String? selectedRole;
  List<Worker> workers = [];
  List<String> roles = [];

  @override
  void initState() {
    super.initState();
    _fetchWorkers();
  }

  Future<void> _fetchWorkers() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('workers')
        .where('region', isEqualTo: widget.region)
        .get();

    setState(() {
      workers = snapshot.docs.map((doc) {
        return Worker(
          name: doc['name'],
          mobile: doc['mobile'],
          place: doc['place'],
          role: doc['role'],
        );
      }).toList();
      roles = workers.map((worker) => worker.role).toSet().toList();
      roles.insert(0, 'Apply no filter'); // Add 'Apply no filter' option
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Worker> filteredWorkers = (selectedRole == null || selectedRole == 'Apply no filter')
        ? workers
        : workers.where((worker) => worker.role == selectedRole).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Workers in ${widget.region}'),
        actions: [
          DropdownButton<String>(
            hint: const Text('Filter by Role'),
            value: selectedRole,
            icon: const Icon(Icons.filter_list),
            onChanged: (String? newValue) {
              setState(() {
                selectedRole = newValue;
              });
            },
            items: roles.map<DropdownMenuItem<String>>((String role) {
              return DropdownMenuItem<String>(
                value: role,
                child: Text(role),
              );
            }).toList(),
          ),
        ],
      ),
      body: Container(
        color: const Color(0xFFD3D3D3), // Light ash background color
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: filteredWorkers.length,
          itemBuilder: (context, index) {
            final worker = filteredWorkers[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: ListTile(
                title: Text(worker.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mobile: ${worker.mobile}'),
                    Text('Place: ${worker.place}'),
                    Text('Role: ${worker.role}'),
                  ],
                ),
                isThreeLine: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
