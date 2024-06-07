import '../entities/entities.dart';

abstract class LoadSimuc {
  Future<List<SimucEntity>> loadSimuc();
}
