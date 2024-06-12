import 'package:flutter/material.dart';
import 'package:responsive_table/export.dart';

List<DatatableHeader> headerAr = [
  DatatableHeader(
    text: "CLIENTE",
    value: "client",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "TIPO DOCUMENTO",
    value: "doc_type",
    show: true,
    sortable: true,
    comands: false,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "DOC. ENTRADA",
    value: "doc_entrance",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "POSIÇÃO",
    value: "position",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  // DatatableHeader(
  //   text: "QTD. ITENS",
  //   value: "quantity_itens",
  //   show: true,
  //   sortable: false,
  //   sourceBuilder: (value, row) {
  //     value = [0 + 20, 150];
  //     List list = List.from(value);
  //     return Container(
  //       child: Column(
  //         children: [
  //           Container(
  //             width: 85,
  //             child: LinearProgressIndicator(
  //               value: list.first / list.last,
  //             ),
  //           ),
  //           Text("${list.first} of ${list.last}")
  //         ],
  //       ),
  //     );
  //   },
  //   textAlign: TextAlign.center,
  // ),
  DatatableHeader(
    text: "QTD. ITENS",
    value: "quantity_itens",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
    sourceBuilder: (value, row) {
      value = [5, int.parse(value)];
      List list = List.from(value);
      return Container(
        child: Column(
          children: [
            Container(
              width: 85,
              child: LinearProgressIndicator(
                value: list.first / list.last,
              ),
            ),
            Text("${list.first} of ${list.last}")
          ],
        ),
      );
    },
  ),
  DatatableHeader(
      text: "DATA ABERTURA",
      value: "date_open",
      show: true,
      sortable: true,
      textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "USUÁRIO",
    value: "user",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  // DatatableHeader(
  //   text: "COMANDOS",
  //   value: "comand",
  //   show: true,
  //   sortable: false,
  //   comands: true,
  //   textAlign: TextAlign.center,
  // ),
];
