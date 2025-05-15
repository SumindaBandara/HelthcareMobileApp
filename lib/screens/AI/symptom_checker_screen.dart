import 'package:flutter/material.dart';
import 'package:my_part/constants.dart';
import 'api_service.dart';
import 'Doctor.dart';
import 'DoctorCard.dart';
// Ensure this import is at the top

class SymptomCheckerScreen extends StatefulWidget {
  const SymptomCheckerScreen({super.key});

  @override
  _SymptomCheckerScreenState createState() => _SymptomCheckerScreenState();
}

class _SymptomCheckerScreenState extends State<SymptomCheckerScreen> {
  final TextEditingController _symptomController = TextEditingController();
  bool _isLoading = false;
  String _aiResponse = '';
  List<Doctor> _suggestedDoctors = [];
  final ApiService _apiService = ApiService();

  @override
  void dispose() {
    _symptomController.dispose();
    super.dispose();
  }

  Future<void> _checkSymptoms() async {
    if (_symptomController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please describe your symptoms')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _aiResponse = '';
      _suggestedDoctors = [];
    });

    final response = await _apiService.analyzeSymptoms(_symptomController.text);

    setState(() {
      _aiResponse = response.healthConcerns;
      _suggestedDoctors = response.suggestedDoctors;
      if (response.isMockResponse) {
        _aiResponse += '\n\n[Using mock data - API limit reached]';
      }
    });

    if (!ApiConstants.isApiAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Free API limit reached. Using mock responses.'),
          duration: Duration(seconds: 3),
        ),
      );
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Symptom Checker'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: null,
        child: Text(
          '${ApiConstants.maxFreeRequests - ApiConstants.requestCount}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor:
            ApiConstants.isApiAvailable ? Colors.green : Colors.orange,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Describe your symptoms',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _symptomController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'E.g., headache, fever, cough for 3 days...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _checkSymptoms,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Analyze Symptoms'),
              ),
            ),
            const SizedBox(height: 24),
            if (_aiResponse.isNotEmpty) ...[
              const Text(
                'AI Analysis:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Text(_aiResponse),
              ),
              const SizedBox(height: 16),
            ],
            if (_suggestedDoctors.isNotEmpty) ...[
              const Text(
                'Suggested Doctors:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ..._suggestedDoctors.map(
                (doctor) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: DoctorCard(doctor: doctor),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
