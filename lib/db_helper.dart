import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';
import 'note.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    if (kIsWeb) {
      databaseFactory = databaseFactoryFfiWeb;
    }

    String path = 'notes.db';
    if (!kIsWeb) {
      String dbPath = await getDatabasesPath();
      path = join(dbPath, 'notes.db');
    }

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            category TEXT
          )
        ''');
      },
    );
  }

  // Insert Note
  static Future<int> insertNote(Note note) async {
    try {
      final db = await database;
      int result = await db.insert('notes', note.toMap());
      debugPrint("Note Inserted Successfully with ID: $result");
      return result;
    } catch (e) {
      debugPrint("Error Inserting Note: $e");
      return -1;
    }
  }

  // Get All Notes
  static Future<List<Note>> getNotes() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query('notes');
      return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
    } catch (e) {
      debugPrint("Error Fetching Notes: $e");
      return [];
    }
  }

  // Update Note
  static Future<int> updateNote(Note note) async {
    try {
      final db = await database;
      return await db.update(
        'notes',
        note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
      );
    } catch (e) {
      debugPrint("Error Updating Note: $e");
      return -1;
    }
  }

  // Delete Note
  static Future<int> deleteNote(int id) async {
    try {
      final db = await database;
      return await db.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      debugPrint("Error Deleting Note: $e");
      return -1;
    }
  }
}