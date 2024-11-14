import 'package:adaptivex/adaptivex.dart';
import 'package:flutter/material.dart';
import 'package:responsive_table/src/datatable_header.dart';
import 'tools/checkbox_style.dart';

class ResponsiveDatatable extends StatefulWidget {
  final Widget? headers;
  final Widget widgetLoad;
  final Widget? rows;
  final bool showSelect;
  final double? heightActionHeader;
  final List<Map<String, dynamic>>? selecteds;
  final Widget? title;
  final Widget? rowAction;
  final Widget? footers;
  final Function(bool? value, Map<String, dynamic> data)? onSelect;
  final bool isLoading;
  final bool autoHeight;
  final bool hideUnderline;
  final bool commonMobileView;
  final bool isExpandRows;
  final List<bool>? expanded;
  final Widget Function(Map<String, dynamic> value)? dropContainer;
  final Function(Map<String, dynamic> value, DatatableHeader header)?
      onChangedRow;
  final Function(Map<String, dynamic> value, DatatableHeader header)?
      onSubmittedRow;

  final List<ScreenSize> reponseScreenSizes;

  final BoxDecoration? rowDecoration;

  final BoxDecoration? selectedDecoration;

  final TextStyle? rowTextStyle;

  final TextStyle? selectedTextStyle;

  final CheckboxStyle? checkboxStyle;

  const ResponsiveDatatable({
    Key? key,
    this.showSelect = false,
    this.onSelect,
    // this.onTabRow,
    this.selecteds,
    this.title,
    this.rowAction,
    this.footers,
    this.isLoading = false,
    this.autoHeight = true,
    this.hideUnderline = true,
    this.commonMobileView = false,
    this.isExpandRows = true,
    this.expanded,
    this.dropContainer,
    this.onChangedRow,
    this.onSubmittedRow,
    this.reponseScreenSizes = const [
      ScreenSize.xs,
      ScreenSize.sm,
      ScreenSize.md
    ],
    this.rowDecoration,
    this.selectedDecoration,
    this.rowTextStyle,
    this.selectedTextStyle,
    this.heightActionHeader,
    this.checkboxStyle,
    this.rows,
    required this.widgetLoad,
    this.headers,
    // required this.onItemSelect,
  }) : super(key: key);

  @override
  _ResponsiveDatatableState createState() => _ResponsiveDatatableState();
}

class _ResponsiveDatatableState extends State<ResponsiveDatatable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null || widget.rowAction != null)
          if (widget.title != null) widget.title!,
        if (widget.rowAction != null) widget.rowAction!,
        SizedBox(height: widget.heightActionHeader),
        if (widget.headers != null) widget.headers!,
        if (widget.isLoading) widget.widgetLoad,
        if (widget.autoHeight) widget.rows!,
        if (!widget.autoHeight) Expanded(child: widget.rows!),
        if (widget.footers != null && widget.rows != null) widget.footers!
      ],
    );
  }
}
