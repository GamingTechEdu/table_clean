import 'package:flutter/material.dart';
import 'package:responsive_table/export.dart';

class DataTesTableItem {
  final Widget? headers;
  final Widget? widgetLoad;
  final Widget? rows;
  final Widget? title;
  final Widget? rowAction;
  final Widget? footers;
  final double? heightActionHeader;
  final Widget Function(Map<String, dynamic> value)? dropContainer;
  final Function(Map<String, dynamic> value, DatatableHeader header)?
      onChangedRow;
  final Function(Map<String, dynamic> value, DatatableHeader header)?
      onSubmittedRow;
  final bool? isLoading;
  final bool? autoHeight;
  final List<ScreenSize> reponseScreenSizes;

  DataTesTableItem({
    this.heightActionHeader,
    this.reponseScreenSizes = const [
      ScreenSize.xs,
      ScreenSize.sm,
      ScreenSize.md
    ],
    this.isLoading = false,
    this.autoHeight = true,
    Key? key,
    this.title,
    this.rowAction,
    this.footers,
    this.dropContainer,
    this.onChangedRow,
    this.onSubmittedRow,
    this.rows,
    this.widgetLoad,
    this.headers,
  });
}
