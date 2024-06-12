import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../presentation/presenters/presenters.dart';

class AlterDate extends StatelessWidget {
  final dynamic value;
  const AlterDate({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<GetxArPresenter>(context);
    return Text(presenter.formatDate(value), textAlign: TextAlign.center,);
  }
}