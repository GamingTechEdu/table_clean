import '../../../../data/usecases/remote_load_simuc.dart';
import '../../../../domain/usecases/usecase.dart';
import '../http/http.dart';

LoadSimuc makeRemoteLoadSimuc() => RemoteLoadSimuc(
  url: makeApiUrl("simucs"),
  httpClient: makeHttpAdapter()
);