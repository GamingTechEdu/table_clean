import '../../domain/entities/entities.dart';
import 'package:intl/intl.dart';

class RemoteSimucModel {
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

  const RemoteSimucModel({
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

  factory RemoteSimucModel.fromJson(Map? json) {
    return RemoteSimucModel(
        numberSerie: json?['number_serie'] ?? '',
        item: json?['item'] ?? '',
        dateRegister: json?['date_register'] ?? '',
        defectRelated: json?['defect_related'] ?? '',
        inspEntrance: json?['insp_entrance'] ?? '',
        defectFound: json?['defect_found'] ?? '',
        docExit: json?['doc_exit'] ?? '',
        status: json?['status'] ?? '',
        user: json?['user'] ?? '',
        arId: json?['ar_id'] ?? '');
  }

  SimucEntity toEntity() => SimucEntity(
        numberSerie: numberSerie,
        item: item,
        dateRegister: formatDate(dateRegister),
        defectRelated: defectRelated,
        inspEntrance: inspEntrance,
        defectFound: defectFound,
        docExit: docExit,
        status: status,
        user: user,
        arId: arId,
      );

  String formatDate(String inputDate) {
    try {
      final inputFormat = DateFormat('yyyy-MM-dd HH:mm');
      final outputFormat = DateFormat('dd-MM-yyyy HH:mm');
      final date = inputFormat.parse(inputDate);
      return outputFormat.format(date);
    } catch (e) {
      print('Erro ao formatar a data: $e');
      return '';
    }
  }
}
