import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class IconButtonFilter extends StatelessWidget {
  const IconButtonFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Relatório",
      child: InkWell(
        onTap: () {},
        child: Icon(Icons.add_task, size: 18,),
      ),
    );
  }
}
