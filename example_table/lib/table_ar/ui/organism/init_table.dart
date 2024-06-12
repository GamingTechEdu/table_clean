import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table/export.dart';
import '../../core/core.dart';
import '../../presentation/presenters/presenters.dart';
import '../atoms/progress_indicator.dart';
import '../molecules/molecules.dart';

class InitTableAr extends StatefulWidget {
  final GetxArPresenter controller;
  InitTableAr({Key? key, required this.controller}) : super(key: key);
  @override
  _InitTableArState createState() => _InitTableArState();
}

class _InitTableArState extends State<InitTableAr> {
  @override
  void initState() {
    super.initState();
    widget.controller.initializeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    headers: Header(),
                    title: DashboardMolecule(),
                    rowAction: RowAction(),
                    widgetLoad: CustomLinearProgressIndicator(),
                    rows: CreateRows(),
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
