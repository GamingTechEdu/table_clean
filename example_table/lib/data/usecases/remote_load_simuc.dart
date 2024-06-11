import 'dart:convert';

import '../../../domain/helpers/domain_error.dart';
import 'package:http/http.dart' as http;
import '../../domain/usecases/usecase.dart';
import '../http/http.dart';

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
    } on HttpError catch (error) {
      throw error == HttpError.forbidden
          ? DomainError.accessDenied
          : DomainError.unexpected;
    }
  }
}
