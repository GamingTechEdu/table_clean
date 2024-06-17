import 'package:flutter/material.dart';

import 'export_sheet.dart';

class ExtractRelatory extends StatelessWidget {
  const ExtractRelatory({Key? key}) : super(key: key);

  Future<void> showDialogRelatory(context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: AlertDialog(
                insetPadding: EdgeInsets.all(20),
                content: Container(
                  width: 500,
                  height: 400,
                  child: Stack(
                    children: [
                      ExportSheet(),
                      Positioned(
                        top: 2,
                        right: 5,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          color: Colors.red,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Tooltip(
        message: "Extrair Relatório",
        child: Icon(
          Icons.assignment,
          size: 25,
        ),
      ),
      onTap: () async {
        await showDialogRelatory(context);
      },
    );
  }
}
