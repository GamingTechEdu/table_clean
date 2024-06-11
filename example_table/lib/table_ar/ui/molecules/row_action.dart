import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/spacers.dart';
import '../../presentation/presenters/presenters.dart';
import '../atoms/atoms.dart';

class RowAction extends StatelessWidget {
  const RowAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GetxArPresenter>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color(0xffd9d9d9),
      ),
      child: DefaultTabController(
        length: 3,
        child: Row(
          children: [
            CheckboxWidget(
              value: controller.selecteds.length == controller.source.length &&
                  controller.source.isNotEmpty,
              onChanged: (value) => controller.onSelectAll(value),
            ),
            Spacers.hV,
            SearchBarAtom(), //TODO: Faltando gerenciamento de estado
            SizedBox(width: 50),
            Container(
              width: 400,
              child: TabBar(
                indicatorColor: const Color.fromARGB(255, 8, 8, 8),
                indicatorWeight: 1,
                dividerHeight: 0,
                labelColor: Colors.white,
                tabs: [
                  Tab(text: 'Em Andamento'),
                  Tab(text: 'Atrasadas'),
                  Tab(text: 'Finalizadas'),
                ],
              ),
            ),
            Spacer(),
            IconButtonFilter(), //TODO: Faltando gerenciamento de estado
          ],
        ),
      ),
    );
  }
}
