import 'package:flutter/material.dart';
import 'package:responsive_table/export.dart';
import '../widgets/widgets.dart';

class AlertDialogCompo extends StatelessWidget {
  const AlertDialogCompo({Key? key}) : super(key: key);

  Future<void> showDialogCompo(context) async {
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
                  width: 1000,
                  height: 500,
                  child: Stack(
                    children: [
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
        message: "Incluir COMPONENTE",
        child: Icon(
          Icons.add,
          size: 20,
        ),
      ),
      onTap: () async {
        await showDialogCompo(context);
      },
    );
  }
}
