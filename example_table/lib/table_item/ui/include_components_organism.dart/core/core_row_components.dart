import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../foundations/foundations.dart';
import '../../../../utils/headers/header_componentes.dart';
import '../../../presentation/presenters/presenters.dart';

List<Map<String, dynamic>> componentes = [
  {"code": "A1", "description": "Antena 915MHz", "value": 10},
  {"code": "C24", "description": "C24: capacitor 150nF 600V", "value": 10},
  {
    "code": "C25",
    "description": "C25: capacitor eletrolítico 10uF / 150V",
    "value": 10
  },
];

class TableComponents extends StatefulWidget {
  const TableComponents({Key? key}) : super(key: key);

  @override
  State<TableComponents> createState() => _TableComponentsState();
}

class _TableComponentsState extends State<TableComponents> {
  List<Widget> listComponents(GetxTableComponentesPresenter controller) {
    List<Widget> components1 = [];

    for (var index = 0; index < componentes.length; index++) {
      final data = componentes[index];
      components1.add(
        Column(
          children: [
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(controller.showSelect ? 0 : 11),
              decoration: controller.selecteds.contains(data)
                  ? Decorations.selectedDecoration
                  : Decorations.rowDecoration,
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (controller.showSelect)
                        Row(
                          children: [
                            Checkbox(
                                value: controller.selecteds.contains(data),
                                onChanged: (value) {
                                  setState(() {
                                    controller.onSelect(value, data);
                                  });
                                }),
                          ],
                        ),
                      ...headersComponente
                          .where((header) => header.show == true)
                          .map(
                            (header) => Expanded(
                              flex: header.flex,
                              child: header.sourceBuilder != null
                                  ? header.sourceBuilder!(
                                      data[header.value], data)
                                  : Text(
                                      "${data[header.value]}",
                                      textAlign: header.textAlign,
                                      style: controller.selecteds.contains(data)
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
            )
          ],
        ),
      );
    }

    return components1;
  }

  @override
  Widget build(BuildContext context) {
    final GetxTableComponentesPresenter controller =
        Get.put(GetxTableComponentesPresenter());
    return ListView(
      children: listComponents(controller),
    );
  }
}
