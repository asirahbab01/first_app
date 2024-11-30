import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

class PolicyDialog extends StatefulWidget {
  final String mdFileName;

  const PolicyDialog({super.key, required this.mdFileName});

  @override
  _PolicyDialogState createState() => _PolicyDialogState();
}

class _PolicyDialogState extends State<PolicyDialog> {
  String _policyContent = '';

  @override
  void initState() {
    super.initState();
    _loadPolicyContent();
  }

  Future<void> _loadPolicyContent() async {
    final String content = await rootBundle.loadString('assets/${widget.mdFileName}');
    setState(() {
      _policyContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // Transparent background
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95), // Slightly transparent white
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                      fontSize: 23,
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Divider(thickness: 1, color: Colors.grey[300]),
                Expanded(
                  child: _policyContent.isNotEmpty
                      ? Markdown(
                          data: _policyContent,
                          shrinkWrap: true,
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            top: 8,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red.withOpacity(0.8),
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
