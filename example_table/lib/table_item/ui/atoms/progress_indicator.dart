import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/presenters/presenters.dart';

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<GetxTablePresenter>(context);
    return presenter.isLoading != false
        ? LinearProgressIndicator(
            backgroundColor: Colors.grey.shade200,
            color: Colors.orange,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            minHeight: 2.0,
          )
        : Container();
  }
}
