import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/Note.dart';

class NoteDatabaseHelper {
  static final NoteDatabaseHelper instance = NoteDatabaseHelper._init();
  static Database? _database;

  NoteDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('note_database.db');
    return _database!;
  }
  Future<Database>_initDB(String filePath) async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath,filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
  Future _createDB(Database db, int vertion) async {
    await db.execute('''
      CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        content TEXT NOT NULL,
        priority INTEGER NOT NULL,
        createAt TEXT NOT NULL,
        modifiedAt TEXT NOT NULL,
        tags TEXT NOT NULL,
        color TEXT
      )
      ''');
    await _insertSampleData(db);
  }
  Future _insertSampleData(Database db) async {
    final List<Map<String, dynamic>> sampleNotes = [
      {
        'title': 'Note 1',
        'content': 'Day la note dau tien',
        'priority': 1,
        'createAt': DateTime(2025, 4, 1).toIso8601String(),
        'modifiedAt': DateTime(2025, 4, 3).toIso8601String(),
        'tags': 'Tag1,Tag2',
        'color': '4294198070'
      },
      {
        'title': 'Note 2',
        'content': 'Day la note thu hai',
        'priority': 2,
        'createAt': DateTime(2025, 4, 2).toIso8601String(),
        'modifiedAt': DateTime(2025, 4, 4).toIso8601String(),
        'tags': 'Tag3,Tag4',
        'color': '4294198070'
      }
    ];

    //Chen tung note vao database
    for (final noteData in sampleNotes) {
      await db.insert('notes', noteData);
    }
  }
  //Dong ket noi
  Future close() async {
    final db = await instance.database;
    db.close();
  }
  //Create - Them note moi
  Future<int> createNote(Note note) async {
    final db = await instance.database;
    return await db.insert('notes', note.toMap());
  }
  //Read - Doc tat ca note
  Future<List<Note>> getAllNotes() async {
    final db = await instance.database;
    final result = await db.query('notes');
    return result.map((map) => Note.fromMap(map)).toList();
  }
  //Read - Doc note theo id
  Future<Note?> getNoteById(int id) async {
    final db = await instance.database;
    final maps = await db.query('notes', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return Note.fromMap(maps.first);
    }
    return null;
  }
  //Update - Cap nhat note
  Future<int> updateNote(Note note) async {
    final db = await instance.database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }
  //Delete - Xoa note
  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
  //Delete - Xoa tat ca note
  Future<int> deleteAllNotes() async {
    final db = await instance.database;
    return await db.delete('notes');
  }
  //Dem so luong note
  Future<int> countNotes() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM notes');
    return Sqflite.firstIntValue(result) ?? 0;
  }
  Future<List<Note>> getNotesByPriority(int priority) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      where: 'priority = ?',
      whereArgs: [priority],
    );
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }
  Future<List<Note>> getNotesByCreateAt(DateTime start, DateTime end) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'notes',
      where: 'createAt >= ? AND createAt <= ?',
      whereArgs: [start.toIso8601String(), end.toIso8601String()],
      orderBy: 'createAt DESC',
    );
    return List.generate(maps.length, (i) {
      return Note.fromMap(maps[i]);
    });
  }
}