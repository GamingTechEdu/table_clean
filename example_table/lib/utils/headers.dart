import 'package:flutter/material.dart';
import 'package:responsive_table/responsive_table.dart';

List<DatatableHeader> headers = [
  DatatableHeader(
    text: "N RECEBIMENTO",
    value: "id",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "CLIENTE",
    value: "name",
    show: true,
    flex: 2,
    sortable: true,
    comands: false,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "Doc. ENTRADA",
    value: "sku",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "ITEM",
    value: "category",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "QUANTIDADE",
    value: "price",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "ABERTO EM",
    value: "margin",
    show: true,
    sortable: true,
    textAlign: TextAlign.center,
  ),
  DatatableHeader(
    text: "Doc. SAÍDA",
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
    text: "ABERTO POR",
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
