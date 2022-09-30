// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_contract_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EContractResponse _$EContractResponseFromJson(Map<String, dynamic> json) =>
    EContractResponse(
      json['code'],
      json['message'],
      json['data'] == null
          ? null
          : EContractDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EContractResponseToJson(EContractResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };

EContractDataResponse _$EContractDataResponseFromJson(
        Map<String, dynamic> json) =>
    EContractDataResponse(
      tikiLeadId: json['tiki_lead_id'] as String?,
      contractInfo: json['contract_info'] == null
          ? null
          : ContractInfoDataResponse.fromJson(
              json['contract_info'] as Map<String, dynamic>),
      pdfPages: (json['pdf_pages'] as List<dynamic>?)
          ?.map((e) => PdfPageDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EContractDataResponseToJson(
        EContractDataResponse instance) =>
    <String, dynamic>{
      'tiki_lead_id': instance.tikiLeadId,
      'contract_info': instance.contractInfo,
      'pdf_pages': instance.pdfPages,
    };

ContractInfoDataResponse _$ContractInfoDataResponseFromJson(
        Map<String, dynamic> json) =>
    ContractInfoDataResponse(
      contractName: json['contract_name'] as String?,
      expiredDate: json['expired_date'] as int?,
    );

Map<String, dynamic> _$ContractInfoDataResponseToJson(
        ContractInfoDataResponse instance) =>
    <String, dynamic>{
      'contract_name': instance.contractName,
      'expired_date': instance.expiredDate,
    };

PdfPageDataResponse _$PdfPageDataResponseFromJson(Map<String, dynamic> json) =>
    PdfPageDataResponse(
      orientation:
          $enumDecodeNullable(_$PdfPageOrientationEnumMap, json['orientation']),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$PdfPageDataResponseToJson(
        PdfPageDataResponse instance) =>
    <String, dynamic>{
      'orientation': _$PdfPageOrientationEnumMap[instance.orientation],
      'content': instance.content,
    };

const _$PdfPageOrientationEnumMap = {
  PdfPageOrientation.landscape: 'landscape',
  PdfPageOrientation.portrait: 'portrait',
};
