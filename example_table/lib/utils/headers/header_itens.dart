import 'package:flutter/material.dart';
import 'package:responsive_table/export.dart';

List<DatatableHeader> headerItem = [
  DatatableHeader(
    text: "NUMERO DE SERIE",
    value: "number_serie",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "ITEM",
    value: "item",
    show: true,
    sortable: true,
    comands: false,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "DATA CADASTRO",
    value: "date_register",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "DEFEITO RELATADO",
    value: "defect_related",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "INSP. ENTRADA",
    value: "insp_entrance",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "DEFEITO ENCONTRADO",
    value: "defect_found",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "NOTA FISCAL",
    value: "doc_exit",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "STATUS",
    value: "status",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
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
  DatatableHeader(
    text: "COMANDOS",
    value: "comand",
    show: true,
    sortable: false,
    comands: true,
    textAlign: TextAlign.center,
  ),
];
