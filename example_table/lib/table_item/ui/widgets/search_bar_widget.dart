import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../foundations/foundations.dart';
import '../../presentation/presenters/presenters.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetxTablePresenter controller = Get.put(GetxTablePresenter());
    // final controller = Provider.of<GetxTablePresenter>(context);
    return Container(
      height: 40,
      width: 300,
      decoration: Decorations.searchBarDecoration,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.orange, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black26, width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: 'Pesquisar' +
                controller.searchKey!
                    .replaceAll(new RegExp('[\\W_]+'), ' ')
                    .toUpperCase(),
            prefixIcon: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  controller.isSearch = false;
                  controller.initializeData();
                }),
            suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {})),
        onSubmitted: (value) {
          controller.filterData(value);
        },
      ),
    );
  }
}

