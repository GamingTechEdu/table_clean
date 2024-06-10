import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../ui/organism/organism.dart';
import 'factories/form/form.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TABLE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => InitTable(controller: makeGetxCreateSimucPresenter()),
      },
    );
  }
}
