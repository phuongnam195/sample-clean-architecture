abstract class BaseResponse {
  final int? code;
  final String? message;

  BaseResponse(this.code, this.message);

  bool get isSuccess => code == 200;
}
