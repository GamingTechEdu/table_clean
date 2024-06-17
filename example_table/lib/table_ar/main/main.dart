import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table_example/table_item/main/factories/form/form.dart';
import 'package:responsive_table_example/table_item/ui/organism/init_table.dart';

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
      initialRoute: '/tableAr',
      routes: {
        '/tableAr': (_) => InitTableAr(controller: makeGetxCreateArPresenter()),
        '/tableItens': (_) => InitTableItem(controller: makeGetxCreateSimucPresenter())
      },
    );
  }
}
