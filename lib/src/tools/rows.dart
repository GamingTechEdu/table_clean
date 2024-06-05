// import 'package:flutter/material.dart';

// class Rows extends StatelessWidget {
//   const Rows({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//      List<Widget> widgets = [];

//     for (var index = 0; index < widget.source!.length; index++) {
//       final data = widget.source![index];

//     return Column(
//         children: [
//           const SizedBox(height: 10),
//           Container(
//             padding: EdgeInsets.all(widget.showSelect ? 0 : 11),
//             decoration: widget.selecteds!.contains(data)
//                 ? _selectedDecoration
//                 : _rowDecoration,
//             child: InkWell(
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               // hoverColor: Colors.transparent,
//               onTap: () {
//                 widget.onTabRow?.call(data);
//                 setState(() {
//                   widget.expanded![index] = !widget.expanded![index];
//                 });
//               },
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 4, bottom: 4),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     if (widget.showSelect && widget.selecteds != null)
//                       Row(
//                         children: [
//                           Checkbox(
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(5),
//                               ),
//                             ),
//                             overlayColor: const MaterialStatePropertyAll(
//                                 Colors.transparent),
//                             checkColor: Colors.white,
//                             activeColor: Colors.grey,
//                             side: const BorderSide(
//                               color: Color.fromARGB(255, 126, 126, 126),
//                               width: 2,
//                             ),
//                             value: widget.selecteds!.contains(data),
//                             onChanged: (value) {
//                               if (widget.onSelect != null) {
//                                 widget.onSelect!(value, data);
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ...widget.headers
//                         .where((header) => header.show == true)
//                         .map(
//                           (header) => Expanded(
//                               flex: header.flex,
//                               child: header.sourceBuilder != null
//                                   ? header.sourceBuilder!(
//                                       data[header.value], data)
//                                   : header.comands
//                                       ? Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                           children: [
//                                             InkWell(
//                                               onTap: () {},
//                                               child: Icon(
//                                                 Icons.remove_red_eye_rounded,
//                                                 size: 20,
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () {},
//                                               child: Icon(
//                                                 Icons.add_chart_sharp,
//                                                 size: 20,
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () {},
//                                               child: Icon(
//                                                 Icons.access_time_filled_sharp,
//                                                 size: 20,
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: () {},
//                                               child: Icon(
//                                                 Icons.account_balance_rounded,
//                                                 size: 20,
//                                               ),
//                                             )
//                                           ],
//                                         )
//                                       : Text("${data[header.value]}",
//                                           textAlign: header.textAlign,
//                                           style:
//                                               widget.selecteds!.contains(data)
//                                                   ? widget.selectedTextStyle
//                                                   : widget.rowTextStyle)),
//                         )
//                         .toList(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // if (widget.isExpandRows &&
//           //     widget.expanded![index] &&
//           //     widget.dropContainer != null)
//           //   widget.dropContainer!(data)
//         ],
//       );
//   }
// }