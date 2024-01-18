import 'dart:io';

import 'package:dio/dio.dart';

class DiabeticaCareService {
  final String unsplashApiUrl =
      'https://api.unsplash.com/photos/?query=health&client_id=7sbnrAAnscHC2i2FynirBqNbxUpEKNJk1P9ycK_xG2Q';

  Future<List<String>> fetchImages() async {
    try {
      final response = await Dio().get(unsplashApiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((item) {
          return item['urls']['regular'] as String;
        }).toList();
      } else {
        // Handle error
        print('Failed to fetch images. Status Code: ${response.statusCode}');
        return [];
      }
    } on DioError catch (e) {
      // Handle Dio errors
      if (e.type == DioErrorType.other) {
        if (e.error is SocketException) {
          print('Connection error: ${e.error}');
        }
      } else if (e.type == DioErrorType.response) {
        print('Dio response error: ${e.response?.statusCode}');
      } else {
        print('Dio error: $e');
      }

      return [];
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
      return [];
    }
  }
}
