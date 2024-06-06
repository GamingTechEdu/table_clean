import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

List<DatatableHeader> headers = [
  DatatableHeader(
    text: "NUMERO DE SERIE",
    value: "id",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "ITEM",
    value: "name",
    show: true,
    flex: 2,
    sortable: true,
    comands: false,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "DATA CADASTRO",
    value: "sku",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "DEFEITO RELATADO",
    value: "category",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "INSP. ENTRADA",
    value: "price",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "DEFEITO ENCONTRADO",
    value: "margin",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "NOTA FISCAL",
    value: "in_stock",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "STATUS",
    value: "alert",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "USUÁRIO",
    value: "received",
    show: true,
    sortable: false,
    sourceBuilder: (value, row) {
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
