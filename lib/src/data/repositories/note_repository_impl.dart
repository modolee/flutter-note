import 'package:note/src/data/data_sources/note_db.dart';
import 'package:note/src/domain/models/note/note.dart';
import 'package:note/src/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDb db;

  NoteRepositoryImpl({
    required this.db,
  });

  @override
  Future<Note?> create(Note note) {
    return db.create(note);
  }

  @override
  Future<int?> delete(int id) {
    return db.delete(id);
  }

  @override
  Future<List<Note>?> readAll() {
    return db.readAll();
  }

  @override
  Future<Note?> readById(int id) {
    return db.readById(id);
  }

  @override
  Future<Note?> update(Note note) {
    return db.update(note);
  }
}
