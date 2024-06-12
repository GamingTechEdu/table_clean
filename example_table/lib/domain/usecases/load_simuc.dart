import '../entities/entities.dart';

abstract class LoadSimuc {
  Future<List<SimucEntity>> loadSimuc();
}

// abstract class LoadSimuc {
//   Future<List<Map<String, dynamic>>> loadSimuc();
// }
