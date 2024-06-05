import 'package:flutter/material.dart';

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
                contentPadding: EdgeInsets.zero,
                insetPadding: EdgeInsets.all(20),
                content: Container(
                  width: 1000,
                  height: 500,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10), 
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          color: Colors.black,
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
