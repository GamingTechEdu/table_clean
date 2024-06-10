import 'dart:convert';

import '../../../domain/helpers/domain_error.dart';
import '../../domain/entities/entities.dart';
import 'package:http/http.dart' as http;
import '../../domain/usecases/usecase.dart';
import '../http/http.dart';
import '../models/models.dart';

// class RemoteLoadSimuc implements LoadSimuc {
//   @override
//   Future<List<SimucEntity>> loadSimuc() async{
//     try {
//         final jsonString = await rootBundle.loadString('assets/mock_simuc.json');
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

class RemoteLoadSimuc implements LoadSimuc {
  final String url;
  final HttpClient httpClient;

  RemoteLoadSimuc({
    required this.url,
    required this.httpClient,
  });

  @override
  Future<List<Map<String, dynamic>>> loadSimuc() async {
    try {
      final httpResponse = await http.get(Uri.parse(url));
      List<dynamic> responseBody = json.decode(httpResponse.body);
      List<Map<String, dynamic>> responseList =
          responseBody.cast<Map<String, dynamic>>();
      return responseList;

      // final httpResponse = await httpClient.request(url: url, method: 'get');
      // print(httpResponse);
      // return httpResponse;
      // return httpResponse.map<SimucEntity>((json) {
      //   final simucEntity = RemoteSimucModel.fromJson(json).toEntity();
      //   return simucEntity;
      // }).toList();
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
