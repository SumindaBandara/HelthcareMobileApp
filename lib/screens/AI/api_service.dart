import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'Doctor.dart';
import 'constants.dart';

class SymptomAnalysisResponse {
  final String healthConcerns;
  final List<Doctor> suggestedDoctors;
  final bool isMockResponse;

  SymptomAnalysisResponse({
    required this.healthConcerns,
    required this.suggestedDoctors,
    this.isMockResponse = false,
  });
}

class ApiService {
  Future<SymptomAnalysisResponse> analyzeSymptoms(String symptoms) async {
    if (!ApiConstants.isApiAvailable) {
      return _getMockResponse(symptoms);
    }

    try {
      ApiConstants.requestCount++;

      final response = await http.post(
        Uri.parse('${ApiConstants.deepSeekBaseUrl}/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.deepSeekApiKey}',
        },
        body: jsonEncode({
          'model': 'deepseek-chat',
          'messages': [
            {
              'role': 'user',
              'content': 'Analyze these symptoms: $symptoms. '
                  'Respond in format: '
                  'Health Concerns: [text] | Doctor Types: [comma-separated specialties]'
            }
          ],
          'temperature': 0.4,
          'max_tokens': 500,
        }),
      );

      if (response.statusCode == 200) {
        return _parseResponse(response.body);
      } else {
        return _getMockResponse(symptoms);
      }
    } catch (e) {
      return _getMockResponse(symptoms);
    }
  }

  SymptomAnalysisResponse _parseResponse(String responseBody) {
    final data = jsonDecode(responseBody);
    final content = data['choices'][0]['message']['content'];

    final parts = content.split('|');
    final healthConcerns = parts[0].replaceFirst('Health Concerns:', '').trim();
    final doctorTypes = parts.length > 1
        ? parts[1].replaceFirst('Doctor Types:', '').trim().split(',')
        : ['General Physician'];

    return SymptomAnalysisResponse(
      healthConcerns: healthConcerns,
      suggestedDoctors: _getDoctorsBySpecialties(doctorTypes),
    );
  }

  SymptomAnalysisResponse _getMockResponse(String symptoms) {
    final mockConditions = [
      'viral infection',
      'common cold',
      'seasonal allergies',
      'stress-related symptoms'
    ];

    final mockSpecialties = [
      'General Physician',
      'ENT Specialist',
      'Internal Medicine'
    ];

    final rng = Random();
    return SymptomAnalysisResponse(
      healthConcerns: 'Based on your symptoms "$symptoms", you might have '
          '${mockConditions[rng.nextInt(mockConditions.length)]}. '
          'Rest and hydration are recommended.',
      suggestedDoctors: _getDoctorsBySpecialties(
          [mockSpecialties[rng.nextInt(mockSpecialties.length)]]),
      isMockResponse: true,
    );
  }

  List<Doctor> _getDoctorsBySpecialties(List<String> specialties) {
    final allDoctors = [
      Doctor(
        name: 'Dr. Vaamana',
        specialty: 'Dentist',
        rating: 4.7,
        distance: '800m away',
        imageUrl: 'assets/doctor1.jpg',
      ),
      Doctor(
        name: 'Dr. Sarah Johnson',
        specialty: 'Dentist',
        rating: 4.5,
        distance: '1.2km away',
        imageUrl: 'assets/doctor2.jpg',
      ),
      Doctor(
        name: 'Dr. Michael Brown',
        specialty: 'Cardiologist',
        rating: 4.8,
        distance: '2km away',
        imageUrl: 'assets/doctor3.jpg',
      ),
      Doctor(
        name: 'Dr. Emily Chen',
        specialty: 'General Physician',
        rating: 4.6,
        distance: '1.5km away',
        imageUrl: 'assets/doctor1.jpg',
      ),
    ];

    return allDoctors.where((doctor) {
      return specialties.any((type) =>
          doctor.specialty.toLowerCase().contains(type.toLowerCase().trim()));
    }).toList();
  }
}
