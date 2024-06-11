import '../../../../data/usecases/remote_load_ar.dart';
import '../../../../domain/usecases/usecase.dart';
import '../http/http.dart';

LoadAr makeRemoteLoadAr() => RemoteLoadAr(
  url: makeApiUrl("ars"),
  httpClient: makeHttpAdapter()
);