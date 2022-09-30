import 'package:sample_clean_arch/core/constants/enums.dart';

class EContractEntity {
  final String? tikiLeadId;
  final ContractInfoEntity? contractInfo;
  final List<PdfPageEntity> pdfPages;

  EContractEntity({this.tikiLeadId, this.contractInfo, this.pdfPages = const []});
}

class ContractInfoEntity {
  final String? contractName;
  final DateTime? expiredDate;

  ContractInfoEntity({this.contractName, this.expiredDate});
}

class PdfPageEntity {
  final PdfPageOrientation? orientation;
  final String? content;

  PdfPageEntity({this.orientation, this.content});
}
