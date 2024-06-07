import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/responsive_table.dart';

import '../../../foundations/foundations.dart';
import '../../../utils/utils.dart';
import '../../presentation/presenters/presenters.dart';
import '../molecules/molecules.dart';

class InitTable extends StatefulWidget {
  // final GetxTablePresenter controller;
  InitTable({Key? key}) : super(key: key);
  @override
  _InitTableState createState() => _InitTableState();
}

class _InitTableState extends State<InitTable> {
  final GetxTablePresenter controller = Get.put(GetxTablePresenter());

  @override
  void initState() {
    super.initState();
    controller.initializeData();
    //  widget.controller.initializeData();
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

  @override
  void dispose() {
    super.dispose();
  }
}
