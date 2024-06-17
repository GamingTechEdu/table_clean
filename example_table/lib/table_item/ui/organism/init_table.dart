import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/export.dart';

import '../../presentation/presenters/presenters.dart';
import '../atoms/progress_indicator.dart';
import '../core/core.dart';
import '../molecules/molecules.dart';

class InitTableItem extends StatefulWidget {
  final GetxTablePresenter controller;
  InitTableItem({Key? key, required this.controller}) : super(key: key);
  @override
  _InitTableItemState createState() => _InitTableItemState();
}

class _InitTableItemState extends State<InitTableItem> {
  @override
  void initState() {
    super.initState();
     widget.controller.initializeData();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final String id = ModalRoute.of(context)!.settings.arguments as String;
  //   widget.controller.initializeData(id);
  // }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;
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
                    rowAction: RowAction(),
                    widgetLoad: CustomLinearProgressIndicator(),
                    rows: CreateRows(id: id),
                    footers: FooterMolecule(),
                    reponseScreenSizes: [ScreenSize.xs],
                    autoHeight: false,
                    isLoading: widget.controller.isLoading,
                    heightActionHeader: 15,
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
