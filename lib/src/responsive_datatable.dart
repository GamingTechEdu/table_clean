import 'package:flutter/material.dart';
import '../responsive_table.dart';
import 'decorations/default_decoration.dart';
import 'tools/utils.dart';

typedef void ItemSelectedCallback();

class ResponsiveDatatable extends StatefulWidget {
  // final ItemSelectedCallback onItemSelect;
  final Widget widgetLoad;
  final Widget rows;
  final bool showSelect;
  final List<DatatableHeader> headers;
  final double? heightActionHeader;
  final List<Map<String, dynamic>>? selecteds;
  final Widget? title;
  final Widget? rowAction;
  final Widget? footers;
  final Function(bool? value)? onSelectAll;
  final Function(bool? value, Map<String, dynamic> data)? onSelect;
  final Function(dynamic value)? onSort;
  final String? sortColumn;
  final bool? sortAscending;
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

  final BoxDecoration? headerDecoration;

  final BoxDecoration? rowDecoration;

  final BoxDecoration? selectedDecoration;

  final TextStyle? headerTextStyle;

  final TextStyle? rowTextStyle;

  final TextStyle? selectedTextStyle;

  final CheckboxStyle? checkboxStyle;

  const ResponsiveDatatable({
    Key? key,
    this.showSelect = false,
    this.onSelectAll,
    this.onSelect,
    // this.onTabRow,
    this.onSort,
    this.headers = const [],
    this.selecteds,
    this.title,
    this.rowAction,
    this.footers,
    this.sortColumn,
    this.sortAscending,
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
    this.headerDecoration,
    this.rowDecoration,
    this.selectedDecoration,
    this.headerTextStyle,
    this.rowTextStyle,
    this.selectedTextStyle,
    this.heightActionHeader,
    this.checkboxStyle,
    required this.rows,
    required this.widgetLoad,
    // required this.onItemSelect,
  }) : super(key: key);

  @override
  _ResponsiveDatatableState createState() => _ResponsiveDatatableState();
}

class _ResponsiveDatatableState extends State<ResponsiveDatatable> {
  Widget desktopHeader() {
    final _headerDecoration = widget.headerDecoration ?? defaultDesktopHeader;
    return Container(
      decoration: _headerDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.showSelect && widget.selecteds != null)
            Container(width: 100),
          ...widget.headers
              .where((header) => header.show == true)
              .map(
                (header) => Expanded(
                    flex: header.flex,
                    child: InkWell(
                      onTap: () {
                        if (widget.onSort != null && header.sortable) {
                          widget.onSort!(header.value);
                        }
                      },
                      child: header.headerBuilder != null
                          ? header.headerBuilder!(header.value)
                          : Container(
                              padding: const EdgeInsets.all(11),
                              alignment:
                                  Utilities.headerAlignSwitch(header.textAlign),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    header.text,
                                    textAlign: header.textAlign,
                                    style: widget.headerTextStyle,
                                  ),
                                  if (widget.sortColumn != null &&
                                      widget.sortColumn == header.value)
                                    widget.sortAscending!
                                        ? const Icon(Icons.arrow_downward,
                                            size: 15)
                                        : const Icon(Icons.arrow_upward,
                                            size: 15)
                                ],
                              ),
                            ),
                    )),
              )
              .toList()
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.title != null || widget.rowAction != null)
          if (widget.title != null) widget.title!,
        if (widget.rowAction != null) widget.rowAction!,
        SizedBox(height: widget.heightActionHeader),
        if (widget.headers.isNotEmpty) desktopHeader(),
        if (widget.isLoading) widget.widgetLoad,
        if (widget.autoHeight) widget.rows,
        if (!widget.autoHeight) Expanded(child: widget.rows),
        if (widget.footers != null) widget.footers!
      ],
    );
  }
}
