import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table_example/table_item/main/factories/form/form_factory.dart';

import '../ui/organism/organism.dart';

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
        '/': (_) => InitTable(),
      },
    );
  }
}
