import 'package:equatable/equatable.dart';

class SimucEntity extends Equatable {
  final String numberSerie;
  final String item;
  final String dateRegister;
  final String defectRelated;
  final String inspEntrance;
  final String defectFound;
  final String docExit;
  final String status;
  final String user;
  final String arId;

  @override
  List get props => [
        numberSerie,
        item,
        dateRegister,
        defectRelated,
        inspEntrance,
        defectFound,
        docExit,
        status,
        user,
        arId
      ];

  const SimucEntity({
    required this.numberSerie,
    required this.item,
    required this.dateRegister,
    required this.defectRelated,
    required this.inspEntrance,
    required this.defectFound,
    required this.docExit,
    required this.status,
    required this.user,
    required this.arId,
  });
}
