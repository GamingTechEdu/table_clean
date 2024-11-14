import 'package:adaptivex/adaptivex.dart';
import 'package:flutter/material.dart';
import 'data/data_testetable.dart';
import 'tools/checkbox_style.dart';

class TesteTable extends StatefulWidget {
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final bool showSelect;
  final List<Map<String, dynamic>>? selecteds;
  final DataTesTableItem table;
  final Function(bool? value, Map<String, dynamic> data)? onSelect;
  final bool hideUnderline;
  final bool commonMobileView;
  final bool isExpandRows;
  final List<bool>? expanded;
  final BoxDecoration? rowDecoration;
  final BoxDecoration? selectedDecoration;
  final TextStyle? rowTextStyle;
  final TextStyle? selectedTextStyle;
  final CheckboxStyle? checkboxStyle;

  const TesteTable({
    Key? key,
    this.showSelect = false,
    this.onSelect,
    this.selecteds,
    this.hideUnderline = true,
    this.commonMobileView = false,
    this.isExpandRows = true,
    this.expanded,
    this.rowDecoration,
    this.selectedDecoration,
    this.rowTextStyle,
    this.selectedTextStyle,
    this.checkboxStyle,
    this.margin = const EdgeInsets.all(10),
    this.padding = const EdgeInsets.all(0),
    required this.table,
  }) : super(key: key);

  @override
  _TesteTableState createState() => _TesteTableState();
}

class _TesteTableState extends State<TesteTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: widget.margin,
          padding: widget.padding,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.96,
          ),
          child: Column(
            children: [
              if (widget.table.title != null || widget.table.rowAction != null)
                if (widget.table.title != null) widget.table.title!,
              if (widget.table.rowAction != null) widget.table.rowAction!,
              SizedBox(height: widget.table.heightActionHeader),
              if (widget.table.headers != null) widget.table.headers!,
              if (widget.table.isLoading != null) widget.table.widgetLoad!,
              if (widget.table.autoHeight!) widget.table.rows!,
              if (!widget.table.autoHeight!)
                Expanded(child: widget.table.rows!),
              if (widget.table.footers != null && widget.table.rows != null)
                widget.table.footers!
            ],
          ),
        ),
      ),
    );
  }
}
