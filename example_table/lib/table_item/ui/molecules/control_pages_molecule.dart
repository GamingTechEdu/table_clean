import 'package:flutter/material.dart';

import '../atoms/icon_buttons/icon_buttons.dart';

class ControlPagesMolecule extends StatelessWidget {
  const ControlPagesMolecule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: NavigatePagesAtom()
    );
  }
}
