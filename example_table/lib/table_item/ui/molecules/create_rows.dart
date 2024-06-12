import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../foundations/foundations.dart';

import '../../../utils/utils.dart';
import '../../presentation/presenters/presenters.dart';
import '../atoms/atoms.dart';

class CreateRows extends StatefulWidget {
  dynamic data;
  CreateRows({
    Key? key, this.data,
  }) : super(key: key);

  @override
  State<CreateRows> createState() => _CreateRowsState();
}

class _CreateRowsState extends State<CreateRows> {
  List<Widget> desktopList(GetxTablePresenter controller) {
    List<Widget> widgets = [];

    for (var index = 0; index < controller.source.length; index++) {
       widget.data = controller.source[index];
      if (widget.data["defect_found"] == null) {
        widget.data["defect_found"] = "EM MANUTENÇÃO";
      }
      ;

      widgets.add(
        Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(controller.showSelect ? 0 : 11),
              decoration: controller.selecteds.contains(widget.data)
                  ? Decorations.selectedDecoration
                  : Decorations.rowDecoration,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    controller.expanded![index] = !controller.expanded![index];
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (controller.showSelect)
                        Row(
                          children: [
                            CheckboxWidget(
                                value: controller.selecteds.contains(widget.data),
                                onChanged: (value) =>
                                    controller.onSelect(value, widget.data)),
                          ],
                        ),
                      ...headerItem
                          .where((header) => header.show == true)
                          .map(
                            (header) => Expanded(
                              flex: header.flex,
                              child: header.sourceBuilder != null
                                  ? header.sourceBuilder!(
                                      widget.data[header.value], widget.data)
                                  : header.comands
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IncludeComponents(),
                                            ExtractRelatory(),
                                          ],
                                        )
                                      : Text(
                                          "${widget.data[header.value]}",
                                          textAlign: header.textAlign,
                                          style: controller.selecteds
                                                  .contains(widget.data)
                                              ? TextDecoration.selectedTextStyle
                                              : TextDecoration.rowTextStyle,
                                        ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
            if (controller.isExpandRows && controller.expanded![index])
              ExpandedRowAtom()
          ],
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // final GetxTablePresenter controller = Get.put(GetxTablePresenter());
    final controller = Provider.of<GetxTablePresenter>(context);
    return ListView(
      children: desktopList(controller),
    );
  }
}
