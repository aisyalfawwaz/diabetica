// import 'package:diabetica/models/Medicine.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static Database? _database;
//   static const String tableName = 'medicines';

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await initDatabase();
//     return _database!;
//   }

//   Future<Database> initDatabase() async {
//     final databasesPath = await getDatabasesPath();
//     final path = join(databasesPath, 'medicines.db');

//     return await openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute('''
//         CREATE TABLE $tableName(
//           id INTEGER PRIMARY KEY AUTOINCREMENT,
//           name TEXT,
//           type TEXT,
//           dosage TEXT,
//           time TEXT,
//           is_notification_on INTEGER
//         )
//       ''');
//     });
//   }

//   Future<int> insertMedicine(Medicine medicine) async {
//     final db = await database;
//     return await db.insert(
//       tableName,
//       medicine.toMap(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Medicine>> getAllMedicines() async {
//     final db = await database;
//     final List<Map<String, dynamic>> maps = await db.query(tableName);
//     return List.generate(maps.length, (i) {
//       return Medicine(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         type: maps[i]['type'],
//         dosage: maps[i]['dosage'],
//         time: maps[i]['time'],
//         isNotificationOn: maps[i]['is_notification_on'] == 1,
//       );
//     });
//   }

//   Future<void> deleteMedicine(int id) async {
//     final db = await database;
//     await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
//   }
// }
