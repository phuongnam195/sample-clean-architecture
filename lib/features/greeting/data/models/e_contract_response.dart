import 'package:sample_clean_arch/core/constants/enums.dart';
import 'package:sample_clean_arch/core/network/models/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sample_clean_arch/features/greeting/domain/entities/e_contract_entity.dart';

part 'e_contract_response.g.dart';

@JsonSerializable()
class EContractResponse extends BaseResponse {
  final EContractDataResponse? data;

  EContractResponse(code, message, this.data) : super(code, message);

  factory EContractResponse.fromJson(Map<String, dynamic> json) => _$EContractResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EContractResponseToJson(this);
}

@JsonSerializable()
class EContractDataResponse {
  @JsonKey(name: 'tiki_lead_id')
  final String? tikiLeadId;
  @JsonKey(name: 'contract_info')
  final ContractInfoDataResponse? contractInfo;
  @JsonKey(name: 'pdf_pages')
  final List<PdfPageDataResponse>? pdfPages;

  EContractDataResponse({this.tikiLeadId, this.contractInfo, this.pdfPages});

  factory EContractDataResponse.fromJson(Map<String, dynamic> json) => _$EContractDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EContractDataResponseToJson(this);

  EContractEntity toEntity() => EContractEntity(
        tikiLeadId: tikiLeadId,
        contractInfo: contractInfo?.toEntity(),
        pdfPages: pdfPages?.map((e) => e.toEntity()).toList() ?? [],
      );
}

@JsonSerializable()
class ContractInfoDataResponse {
  @JsonKey(name: 'contract_name')
  final String? contractName;
  @JsonKey(name: 'expired_date')
  final int? expiredDate; // millisecondsSinceEpoch

  ContractInfoDataResponse({this.contractName, this.expiredDate});

  factory ContractInfoDataResponse.fromJson(Map<String, dynamic> json) => _$ContractInfoDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContractInfoDataResponseToJson(this);

  ContractInfoEntity toEntity() => ContractInfoEntity(
        contractName: contractName,
        expiredDate: expiredDate == null ? null : DateTime.fromMillisecondsSinceEpoch(expiredDate!),
      );
}

@JsonSerializable()
class PdfPageDataResponse {
  @JsonKey(name: 'orientation')
  final PdfPageOrientation? orientation;
  @JsonKey(name: 'content')
  final String? content;

  PdfPageDataResponse({this.orientation, this.content});

  factory PdfPageDataResponse.fromJson(Map<String, dynamic> json) => _$PdfPageDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PdfPageDataResponseToJson(this);

  PdfPageEntity toEntity() => PdfPageEntity(orientation: orientation, content: content);
}
