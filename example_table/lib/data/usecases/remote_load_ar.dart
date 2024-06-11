import 'dart:convert';

import '../../domain/helpers/domain_error.dart';
import '../../domain/usecases/usecase.dart';
import '../http/http.dart';
import 'package:http/http.dart' as http;

class RemoteLoadAr implements LoadAr {
  final String url;
  final HttpClient httpClient;

  RemoteLoadAr({
    required this.url,
    required this.httpClient,
  });


  @override
  Future<List<Map<String, dynamic>>> loadAr() async{
     try {
      final httpResponse = await http.get(Uri.parse(url));
      List<dynamic> responseBody = json.decode(httpResponse.body);
      List<Map<String, dynamic>> responseList =
          responseBody.cast<Map<String, dynamic>>();
      return responseList;
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
