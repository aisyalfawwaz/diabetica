import 'dart:convert';
import 'package:diabetica/models/Medicine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService(String s);

  static Future<void> postMedicalData({
    required Map<String, dynamic> userData,
    required Map<String, dynamic> healthData,
  }) async {
    final Uri apiUrl =
        Uri.parse('https://diabetica-1e76e.et.r.appspot.com/api/medical-data');

    try {
      final requestData = [
        {
          'userid': userData['userid'],
          'fullname': userData['fullName'],
          'age': userData['age'],
          'gender': userData['gender'],
          'weight': userData['weight'],
          'height': userData['height'],
          'smoking': healthData['smoke'],
          'familyhistory': healthData['familyHistory'],
          'glucose': healthData['glucose'],
          'hb': healthData['hba1c'],
          'keton': healthData['keton'],
        }
      ];

      print('Request Payload: ${jsonEncode(requestData)}');

      final response = await http.post(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        // Successfully POSTed to the API
        print('Data sent to API successfully');
      } else {
        // Failed to POST to the API
        print(
            'Failed to send data to API. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Error during POST process
      print('An error occurred: $e');
    }
  }

  static Future<List<Medicine>> fetchMedicineData(String userId) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://diabetica-1e76e.et.r.appspot.com/api/medicine/$userId'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Check if the 'data' key is present in the response
        if (responseData.containsKey('data')) {
          List<dynamic> medicineList = responseData['data'];

          // Convert the fetched data into a list of Medicine objects
          List<Medicine> medicines =
              medicineList.map((data) => Medicine.fromJson(data)).toList();
          return medicines;
        } else {
          // Handle the case where the 'data' key is not present
          print('No data key in the response');
          return [];
        }
      } else {
        // Handle the case where the API call was not successful
        print(
            'Failed to fetch medicine data. Status Code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Handle any error that occurred during the API call
      print('Error fetching medicine data: $e');
      return [];
    }
  }

  static Future<Map<String, dynamic>> getUserDetails(String userId) async {
    try {
      final response = await http.get(Uri.parse(
          'https://diabetica-1e76e.et.r.appspot.com/api/medical-data/$userId'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        print('Response Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        // Handle the case where there is an error, e.g., by logging it
        // and returning a default response indicating the error.
        return {'error': 'Failed to load user details', 'data': null};
      }
    } catch (e) {
      print('Error loading user details: $e');
      // Handle the exception, e.g., by logging it
      // and returning a default response indicating the error.
      return {'error': 'Failed to load user details', 'data': null};
    }
  }

  static Future<void> deleteMedicine(String userId, String medicineId) async {
    try {
      final response = await http.delete(
        Uri.parse(
            'https://diabetica-1e76e.et.r.appspot.com/api/medicine/$userId/$medicineId'),
      );

      if (response.statusCode == 200) {
        // Successfully deleted from the API
        print('Medicine deleted successfully');
      } else {
        // Failed to delete from the API
        print('Failed to delete medicine. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any error that occurred during the API call
      print('Error deleting medicine: $e');
    }
  }

  static Future<void> postHealthTrackingData({
    required String bloodSugarValue,
    required bool bloodSugarType,
    required String hba1c,
    required String ketone,
    required DateTime selectedDateTime,
  }) async {
    try {
      // Get the current user from FirebaseAuth
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid;

        // Create the body to be sent to the API
        List<Map<String, dynamic>> requestBody = [
          {
            'userid': userId,
            'glucose': bloodSugarValue,
            'hb': hba1c,
            'keton': ketone,
            'fasting': bloodSugarType, // Assuming bloodSugarType is a boolean
          }
        ];

        // Print the body being sent to the API in the desired format
        print(jsonEncode(requestBody));

        final response = await http.post(
          Uri.parse('https://diabetica-1e76e.et.r.appspot.com/api/history/'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(requestBody),
        );

        if (response.statusCode == 200) {
          // Successfully posted to the API
          print('Health tracking data posted successfully');
        } else {
          // Failed to post to the API
          print(
              'Failed to post health tracking data. Status Code: ${response.statusCode}');
        }
      } else {
        // Handle the case where the user is not logged in
        print('User is not logged in');
      }
    } catch (e) {
      // Handle any error that occurred during the API call
      print('Error posting health tracking data: $e');
    }
  }

  static Future<void> postMedicineData(
      List<Map<String, dynamic>> medicineData) async {
    final Uri apiUrl =
        Uri.parse('https://diabetica-1e76e.et.r.appspot.com/api/medicine/');

    try {
      final String jsonData = jsonEncode(medicineData);
      print('Sending JSON data to API: $jsonData');

      final response = await http.post(
        apiUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );

      if (response.statusCode == 200) {
        // Successfully POSTed to the API
        print('Medicine data sent to API successfully');
      } else {
        // Failed to POST to the API
        print(
            'Failed to send medicine data to API. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      // Error during POST process
      print('An error occurred while sending medicine data: $e');
    }
  }
}
