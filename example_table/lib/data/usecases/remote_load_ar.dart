import '../../domain/entities/entities.dart';
import '../../domain/helpers/domain_error.dart';
import '../../domain/usecases/usecase.dart';
import '../http/http.dart';

import '../models/remote_ar_model.dart';

class RemoteLoadAr implements LoadAr {
  final String url;
  final HttpClient httpClient;

  RemoteLoadAr({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<List<ArEntity>> loadAr() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse.map<ArEntity>((json) {
        final arEntity = RemoteArModel.fromJson(json).toEntity();
        return arEntity;
      }).toList();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}

