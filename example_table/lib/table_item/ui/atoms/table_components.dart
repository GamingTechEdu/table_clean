import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:responsive_table_example/table_item/ui/widgets/widgets.dart';

import '../../../foundations/foundations.dart';
import '../../presentation/presenters/presenters.dart';
import '../molecules/molecules.dart';
import 'components/components.dart';

List<Map<String, dynamic>> componentes = [
  {"code": "A1", "description": "Antena 915MHz", "value": 10},
  {"code": "C24", "description": "C24: capacitor 150nF 600V", "value": 10},
  {
    "code": "C25",
    "description": "C25: capacitor eletrolítico 10uF / 150V",
    "value": 10
  },
];

List<DatatableHeader> headers = [
  DatatableHeader(
    text: "Code",
    value: "code",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "Description",
    value: "description",
    show: true,
    flex: 2,
    sortable: true,
    comands: false,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "Value",
    value: "value",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
];

class TableComponents extends StatefulWidget {
  const TableComponents({Key? key}) : super(key: key);

  @override
  State<TableComponents> createState() => _TableComponentsState();
}

class _TableComponentsState extends State<TableComponents> {
  List<Widget> ListComponents(GetxTableComponentesPresenter controller) {
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
                            CheckboxAtom(
                                value: controller.selecteds.contains(data),
                                onChanged: (value) {
                                  setState(() {
                                    controller.onSelect(value, data);
                                  });
                                }),
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
      children: ListComponents(controller),
    );
  }
}

void main() {
   final GetxTableComponentesPresenter controller =
        Get.put(GetxTableComponentesPresenter());
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 1000,
            height: 520,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              color: Color.fromARGB(255, 117, 117, 117),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 42, top: 15, bottom: 15),
                  child: SearchBarWidget(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color.fromARGB(255, 221, 221, 221),
                      ),
                      child: ResponsiveDatatable(
                            rows: TableComponents(),
                            widgetLoad: LinearProgressIndicator(),
                            headers: headers,
                            autoHeight: false,
                            // footers: FooterMolecule(),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          tooltip: "Adicionar",
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            print(controller.selecteds);
                            
                          },
                        ),
                        SizedBox(height: 10),
                        IconButton(
                          tooltip: "Remover",
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Container(
                      width: 300,
                      height: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color.fromARGB(255, 221, 221, 221),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 850, top: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Confirmar"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
