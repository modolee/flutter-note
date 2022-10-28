import 'package:note/src/domain/models/note/note.dart';

abstract class NoteRepository {
  Future<Note?> create(Note note);

  Future<List<Note>?> readAll();

  Future<Note?> readById(int id);

  Future<Note?> update(Note note);

  Future<int?> delete(int id);
}
