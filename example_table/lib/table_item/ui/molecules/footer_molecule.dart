import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presentation/presenters/presenters.dart';
import '../atoms/atoms.dart';

class FooterMolecule extends StatelessWidget {
  const FooterMolecule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GetxTablePresenter controller = Get.put(GetxTablePresenter());
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
          RowsPerPageAtom(),
              PageViewsAtom(),
              Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Color(0xffd9d9d9),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    IconButton(
                      highlightColor: Colors.transparent,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                      ),
                      onPressed: controller.currentPage == 1
                          ? null
                          : () {
                              var _nextSet = controller.currentPage -
                                  controller.currentPerPage!;
                              
                                controller.currentPage =
                                    _nextSet > 1 ? _nextSet : 1;
                                controller.resetData(
                                    start: controller.currentPage - 1);
                           
                            },
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                    IconButton(
                      highlightColor: Colors.transparent,
                      icon: Icon(Icons.arrow_forward_ios, size: 16),
                      onPressed: controller.currentPage +
                                  controller.currentPerPage! -
                                  1 >
                              controller.total
                          ? null
                          : () {
                              var _nextSet = controller.currentPage +
                                  controller.currentPerPage!;
                             
                                controller.currentPage =
                                    _nextSet < controller.total
                                        ? _nextSet
                                        : controller.total -
                                            controller.currentPerPage!;
                                controller.resetData(start: _nextSet - 1);
                             
                            },
                      padding: EdgeInsets.symmetric(horizontal: 15),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}
