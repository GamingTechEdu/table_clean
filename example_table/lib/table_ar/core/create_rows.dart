import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_table_example/table_item/main/factories/form/form.dart';
import 'package:responsive_table_example/utils/headers/header_ar.dart';
import '../../foundations/foundations.dart';

import '../../table_item/ui/organism/organism.dart';
import '../presentation/presenters/presenters.dart';
import '../ui/atoms/atoms.dart';

class CreateRows extends StatefulWidget {
  const CreateRows({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateRows> createState() => _CreateRowsState();
}

class _CreateRowsState extends State<CreateRows> {
  List<Widget> desktopList(GetxArPresenter controller) {
    List<Widget> widgets = [];

    for (var index = 0; index < controller.source.length; index++) {
      var data = controller.source[index];

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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => InitTable(
                  //             data: data.ar,
                  //             controller: makeGetxCreateSimucPresenter(),
                  //           )),
                  // );
                  Navigator.of(context)
                    .pushNamed('/tableItens');
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (controller.showSelect)
                        Row(
                          children: [
                            CheckboxWidget(
                                value: controller.selecteds.contains(data),
                                onChanged: (value) =>
                                    controller.onSelect(value, data)),
                          ],
                        ),
                      ...headerAr
                          .where((header) => header.show == true)
                          .map(
                            (header) => Expanded(
                              flex: header.flex,
                              child: header.sourceBuilder != null
                                  ? header.sourceBuilder!(
                                      data.getProperty(header.value), data)
                                  : header.comands
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IncludeComponents(),
                                            ExtractRelatory(),
                                          ],
                                        )
                                      : Text(
                                          "${data.getProperty(header.value)}",
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
            // if (controller.isExpandRows && controller.expanded![index])
            //   ExpandedRowAtom()
          ],
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // final GetxTablePresenter controller = Get.put(GetxTablePresenter());
    final controller = Provider.of<GetxArPresenter>(context);
    return ListView(
      children: desktopList(controller),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('Welcome to the Second Page!'),
      ),
    );
  }
}
