import '../../../domain/helpers/domain_error.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecase.dart';
import '../http/http.dart';
import '../models/models.dart';

class RemoteLoadSimuc implements LoadSimuc {
  final String url;
  final HttpClient httpClient;

  RemoteLoadSimuc({
    required this.url,
    required this.httpClient,s
  });

  @override
  Future<List<SimucEntity>> loadSimuc() async {
    try {
      final httpResponse = await httpClient.request(url: url, method: 'get');
      return httpResponse.map<SimucEntity>((json) {
        final simucEntity = RemoteSimucModel.fromJson(json).toEntity();
        return simucEntity;
      }).toList();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}


// class RemoteLoadSimuc implements LoadSimuc {
//   @override
//   Future<List<SimucEntity>> loadSimuc() async{
//     try {
//         final jsonString = await rootBundle.loadString('assets/simucs.json');
//          final List<dynamic> jsonResponse = json.decode(jsonString);
//          return jsonResponse.map<SimucEntity>((json){
//           final teste = RemoteSimucModel.fromJson(json).toEntity();
//           return teste;
//          }).toList();
//     } on HttpError catch (error) {
//       throw error == HttpError.forbidden
//           ? DomainError.accessDenied
//           : DomainError.unexpected;
//     }
//   }
// }

// void main() async{
//   var teste = RemoteLoadSimuc();
//   await teste.loadSimuc();
// }
