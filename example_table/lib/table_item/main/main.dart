import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

import '../presentation/presenters/getx_table_presenter.dart';
import '../../foundations/foundations.dart';
import '../ui/molecules/molecules.dart';
import '../ui/molecules/row_action.dart';
import '../ui/atoms/create_rows.dart';
import '../../utils/headers.dart';
import '../../utils/utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => DataPage(),
      },
    );
  }
}

class DataPage extends StatefulWidget {
  DataPage({Key? key}) : super(key: key);
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final GetxTablePresenter controller = Get.put(GetxTablePresenter());

  @override
  void initState() {
    super.initState();
    controller.initializeData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TemplateTableMolecule(
      widget: GetBuilder<GetxTablePresenter>(
        builder: (_) {
          return ResponsiveDatatable(
            title: DashboardMoleucle(),
            rowAction: RowAction(),
            widgetLoad: LinearProgressIndicator(),
            rows: CreateRows(),
            footers: FooterMolecule(),
            reponseScreenSizes: [ScreenSize.xs],
            headers: headers,
            autoHeight: false,
            isLoading: controller.isLoading,
            heightActionHeader: 15,
            sortColumn: controller.sortColumn,
            sortAscending: controller.sortAscending,
            onSort: (value) => controller.onSort(value),
            onSelectAll: (value) => controller.onSelectAll(value),
            headerDecoration: Decorations.headerDecoration,
            headerTextStyle: TextDecoration.headerTextStyle,
          );
        },
      ),
    );
  }
}
