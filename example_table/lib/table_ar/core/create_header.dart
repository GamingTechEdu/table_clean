import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table_example/table_ar/presentation/presenters/presenters.dart';
import '../../foundations/foundations.dart';
import '../../utils/headers/header_ar.dart';
import '../../utils/utils.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<GetxArPresenter>(context);
    final _headerDecoration = Decorations.headerDecoration;
    return Container(
      decoration: _headerDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 30),
          ...headerAr.where((header) => header.show == true).map(
                (header) => Expanded(
                  flex: header.flex,
                  child: InkWell(
                    onTap: () => presenter.onSort(header.value),
                    child: header.headerBuilder != null
                        ? header.headerBuilder!(header.value)
                        : Container(
                            padding: const EdgeInsets.all(11),
                            alignment:
                                HeaderAlign.headerAlignSwitch(header.textAlign),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Text(
                                  header.text,
                                  textAlign: header.textAlign,
                                  style: TextDecoration.headerTextStyle,
                                ),
                                if (presenter.sortColumn != null &&
                                    presenter.sortColumn == header.value)
                                  presenter.sortAscending
                                      ? const Icon(Icons.arrow_downward,
                                          size: 15)
                                      : const Icon(Icons.arrow_upward, size: 15)
                              ],
                            ),
                          ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
