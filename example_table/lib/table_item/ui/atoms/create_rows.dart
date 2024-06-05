import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../foundations/foundations.dart';
import '../../../utils/utils.dart';
import '../../presentation/presenters/presenters.dart';
import '../modals/alert_dialog.dart';
import 'components/components.dart';

class CreateRows extends StatefulWidget {
  const CreateRows({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateRows> createState() => _CreateRowsState();
}

class _CreateRowsState extends State<CreateRows> {
  List<Widget> desktopList(GetxTablePresenter controller) {
    List<Widget> widgets = [];

    for (var index = 0; index < controller.source.length; index++) {
      final data = controller.source[index];

      widgets.add(
        Column(
          children: [
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(controller.showSelect ? 0 : 11),
              decoration: controller.selecteds.contains(data)
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
                            CheckboxAtom(
                              value: controller.selecteds.contains(data),
                              onChanged: (value) => controller.onSelect(value, data)
                            ),
                          ],
                        ),
                      ...headers
                          .where((header) => header.show == true)
                          .map(
                            (header) => Expanded(
                              flex: header.flex,
                              child: header.sourceBuilder != null
                                  ? header.sourceBuilder!(
                                      data[header.value], data)
                                  : header.comands
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AlertDialogCompo(),
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.add_chart_sharp,
                                                size: 20,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                // widget.onItemSelect();
                                                // presenter.printar();
                                              },
                                              child: Icon(
                                                Icons.access_time_filled_sharp,
                                                size: 20,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.account_balance_rounded,
                                                size: 20,
                                              ),
                                            )
                                          ],
                                        )
                                      : Text(
                                          "${data[header.value]}",
                                          textAlign: header.textAlign,
                                          style: controller.selecteds
                                                  .contains(data)
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
              ExpandedRow()
          ],
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final GetxTablePresenter controller = Get.put(GetxTablePresenter());
    return ListView(
      children: desktopList(controller),
    );
  }
}
