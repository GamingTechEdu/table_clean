import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_table/export.dart';

import '../../../presentation/presenters/presenters.dart';
import '../../widgets/widgets.dart';
import '../core/core_header_componente.dart';
import '../core/core_row_components.dart';

class ComponentesArea extends StatefulWidget {
  const ComponentesArea({Key? key}) : super(key: key);

  @override
  State<ComponentesArea> createState() => _ComponentesAreaState();
}

class _ComponentesAreaState extends State<ComponentesArea> {
  final GetxTableComponentesPresenter controller =
      Get.put(GetxTableComponentesPresenter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 1000,
          height: 520,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Color.fromARGB(255, 117, 117, 117),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 42, top: 15, bottom: 15),
                // child: SearchBarWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color.fromARGB(255, 221, 221, 221),
                    ),
                    child: ResponsiveDatatable(
                      rows: TableComponents(),
                      widgetLoad: LinearProgressIndicator(),
                      headers: HeaderComponente(),
                      autoHeight: false,
                      // footers: FooterMolecule(),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButtonWidget(
                        tooltip: "Adicionar",
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.onChange();
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      IconButtonWidget(
                        tooltip: "Remover",
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          controller.onChange();
                        },
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
    );
  }
}
