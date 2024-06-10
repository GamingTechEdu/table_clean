import 'package:flutter/material.dart';
import '../atoms/atoms.dart';

class FooterMolecule extends StatelessWidget {
  const FooterMolecule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RowsPerPageAtom(),
        PageViewsAtom(),
        NavigatePagesAtom()
      ],
    );
  }
}
