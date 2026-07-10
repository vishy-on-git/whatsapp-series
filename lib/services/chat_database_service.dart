import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ChatDatabaseService {
  static final ChatDatabaseService instance =
      ChatDatabaseService._constructor();
  static Database? _db;

  ChatDatabaseService._constructor();

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    final directory = await getApplicationDocumentsDirectory();
    final databasePath = join(directory.path, 'chat.db');

    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
      onOpen: (db) async {
        debugPrint('📂 DB Opened at: ${db.path}');
        await db.execute('''
      CREATE TABLE IF NOT EXISTS messages(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sender_id TEXT,
    receiver_id TEXT,
    message TEXT,
    timestamp TEXT,
    status INTEGER
      ''');
      },
    onUpgrade: _onUpgrade
    );
  }

  Future _onUpgrade(Data)

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS messages(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sender_id TEXT,
    receiver_id TEXT,
    message TEXT,
    timestamp TEXT,
    status INTEGER
    )
    ''');
  }

  Future<int> insertMessage(Map<String, dynamic> message) async {
    final db = await instance.database;
    return await db.insert('messages', message);
  }

  Future<List<Map<String, dynamic>>> getMessages(
    String user1,
    String user2,
  ) async {
    final db = await database;

    return await db.query(
      "messages",
      where: '''
    (sender_id=? and receiver_id=?)
    OR
    (sender_id=? and receiver_id=?)
    ''',
      whereArgs: [user1, user2, user2, user1],
      orderBy: "timestamp ASC",
    );
  }

  Future deleteMessage(int id) async {
    final db = await database;
    return await db.delete("messages", where: "id=?", whereArgs: [id]);
  }
}
