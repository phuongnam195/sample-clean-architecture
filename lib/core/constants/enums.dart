import 'package:json_annotation/json_annotation.dart';

enum PdfPageOrientation {
  @JsonValue('landscape')
  landscape,
  @JsonValue('portrait')
  portrait,
}
