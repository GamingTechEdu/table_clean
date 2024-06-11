import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class IconButtonFilter extends StatelessWidget {
  const IconButtonFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      onPressed: () {},
      tooltip: "Relatório",
      icon: Icon(Icons.assignment),
    );
  }
}
