import 'package:meta/meta.dart';

class Medicine {
  final String id;
  final String userId;
  final String medicalName;
  final String medicineType;
  final String dosage;
  final String time;
  final String createdAt;
  final String updatedAt;

  Medicine({
    required this.id,
    required this.userId,
    required this.medicalName,
    required this.medicineType,
    required this.dosage,
    required this.time,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'] ?? '',
      userId: json['userid'] ?? '',
      medicalName: json['medicalName'] ?? '',
      medicineType: json['medicineType'] ?? '',
      dosage: json['dosage'] ?? '',
      time: json['time'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
