import 'package:flutter/material.dart';
import 'package:responsive_table/export.dart';

List<DatatableHeaderItem> headerItem = [
  DatatableHeaderItem(
    text: "NUMERO DE SERIE",
    value: "number_serie",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeaderItem(
    text: "ITEM",
    value: "item",
    show: true,
    sortable: true,
    comands: false,
    textAlign: TextAlign.center,
  ),
  DatatableHeaderItem(
    text: "DATA CADASTRO",
    value: "date_register",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeaderItem(
    text: "DEFEITO RELATADO",
    value: "defect_related",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeaderItem(
    text: "INSP. ENTRADA",
    value: "insp_entrance",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeaderItem(
    text: "DEFEITO ENCONTRADO",
    value: "defect_found",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeaderItem(
      text: "NOTA FISCAL",
      value: "doc_exit",
      show: true,
      sortable: true,
      textAlign: TextAlign.center,
      sourceBuilder: (value, row) {
        switch (value) {
          case "1":
            return Text(value);
          default:
            return Text(
              "AGUARDANDO NOTA",
              style: TextStyle(color: Colors.red),
            );
        }
      }),
  DatatableHeaderItem(
      text: "STATUS",
      value: "status",
      show: true,
      sortable: true,
      textAlign: TextAlign.center,
      sourceBuilder: (value, row) {
        switch (value) {
          case "1":
            return Tooltip(
              message: "Concluido",
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      color: const Color.fromARGB(255, 59, 255, 66),
                    )
                  ],
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 59, 255, 66),
                ),
              ),
            );
          case "2":
            return Tooltip(
              message: "Concluido",
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      color: Colors.yellow,
                    )
                  ],
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
              ),
            );
          case "0":
            return Tooltip(
              message: "Cadastrado",
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 3,
                      color: Colors.red,
                    )
                  ],
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            );
          default:
            return Container();
        }
      }),
  DatatableHeaderItem(
    text: "USUÁRIO",
    value: "user",
    show: true,
    sortable: false,
    // sourceBuilder: (value, row) {
    //   List list = List.from(value);
    //   return Container(
    //     child: Column(
    //       children: [
    //         Container(
    //           width: 85,
    //           child: LinearProgressIndicator(
    //             value: list.first / list.last,
    //           ),
    //         ),
    //         Text("${list.first} of ${list.last}")
    //       ],
    //     ),
    //   );
    // },
    textAlign: TextAlign.center,
  ),
  DatatableHeaderItem(
    text: "COMANDOS",
    value: "comand",
    show: true,
    sortable: false,
    comands: true,
    textAlign: TextAlign.center,
  ),
];
