import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/presenters/presenters.dart';

class DocExit extends StatelessWidget {
  final dynamic value;
  const DocExit({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<GetxTablePresenter>(context);
    return _changeDoc(value,  presenter);
  }

  Widget _changeDoc(value, GetxTablePresenter presenter) {
    switch (value) {
      case "0":
        return Text(
          "AGUARDANDO NOTA",
          style: TextStyle(color: Colors.red),
        );
      default:
        return Text(value);
    }
  }
}
