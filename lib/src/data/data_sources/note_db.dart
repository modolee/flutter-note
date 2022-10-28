import 'package:note/src/domain/models/note/note.dart';
import 'package:sqflite/sqlite_api.dart';

class NoteDb {
  Database db;

  NoteDb(this.db);

  Future<Note?> create(Note note) async {
    final noteId = await db.insert('note', note.toJson());

    if (noteId != 0) {
      note = note.copyWith(id: noteId);
      return note;
    }

    return null;
  }

  Future<List<Note>?> readAll() async {
    final List<Map<String, dynamic>> jsonNotes = await db.query('note');

    if (jsonNotes.isNotEmpty) {
      return jsonNotes.map((jsonNote) => Note.fromJson(jsonNote)).toList();
    }

    return null;
  }

  Future<Note?> readById(int id) async {
    final List<Map<String, dynamic>> jsonNotes = await db.query(
      'note',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (jsonNotes.isNotEmpty) {
      return Note.fromJson(jsonNotes.first);
    }

    return null;
  }

  Future<Note?> update(Note note) async {
    final updatedRows = await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );

    if (updatedRows != 0) {
      return note;
    }

    return null;
  }

  Future<int?> delete(int id) async {
    final deletedRows = await db.delete(
      'note',
      where: 'id =?',
      whereArgs: [id],
    );

    if (deletedRows != 0) {
      return id;
    }

    return null;
  }
}
