import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/export.dart';

import '../../../foundations/foundations.dart';
import '../../../utils/utils.dart';
import '../../presentation/presenters/presenters.dart';
import '../atoms/progress_indicator.dart';
import '../core/core.dart';
import '../molecules/molecules.dart';

class InitTable extends StatefulWidget {
  final GetxTablePresenter controller;
  final dynamic data;
  InitTable({Key? key, required this.controller, this.data}) : super(key: key);
  @override
  _InitTableState createState() => _InitTableState();
}

class _InitTableState extends State<InitTable> {
  @override
  void initState() {
    super.initState();
    widget.controller.initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        iconTheme: IconThemeData(size: 20),
      ),
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
                child: ListenableProvider(
                  create: (_) => widget.controller,
                  child: ResponsiveDatatable(
                    headers: HeaderItem(),
                    title: DashboardMolecule(),
                    rowAction: RowAction(),
                    widgetLoad: CustomLinearProgressIndicator(),
                    rows: CreateRows(),
                    footers: FooterMolecule(),
                    reponseScreenSizes: [ScreenSize.xs],
                    autoHeight: false,
                    isLoading: widget.controller.isLoading,
                    heightActionHeader: 15,
                    onSelectAll: (value) =>
                        widget.controller.onSelectAll(value),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
