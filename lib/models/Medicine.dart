class Medicine {
  final int? id;
  final String name;
  final String type;
  final String dosage;
  final String? time;
  final bool isNotificationOn;

  Medicine({
    this.id,
    required this.name,
    required this.type,
    required this.dosage,
    this.time,
    required this.isNotificationOn,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'dosage': dosage,
      'time': time,
      'is_notification_on': isNotificationOn ? 1 : 0,
    };
  }
}
