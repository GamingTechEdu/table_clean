import 'package:flutter/material.dart';
// import 'package:pdf_creator_flutter/app.dart';

class ExtractRelatory extends StatelessWidget {
  const ExtractRelatory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MyAppPdf()),
        // );
      },
      child: Icon(
        Icons.add_chart_sharp,
        size: 20,
      ),
    );
  }
}
