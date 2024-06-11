import '../../../presentation/presenters/presenters.dart';
import '../usecases/usecases.dart';

GetxArPresenter makeGetxCreateArPresenter() =>
    GetxArPresenter(makeRemoteLoadAr());
