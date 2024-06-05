import 'package:flutter/material.dart';

class TemplateTableMolecule extends StatelessWidget {
  final Widget widget;
  const TemplateTableMolecule({Key? key, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(0),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.96,
              ),
              child: widget,
            )
          ],
        ),
      ),
    );
  }
}
