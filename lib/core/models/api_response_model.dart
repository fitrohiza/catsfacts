class ApiResponseModel<T> {
  ApiResponseModel({
    required this.status,
    this.data,
    this.errors,
    this.message,
    this.warning,
  });

  int status;
  T? errors;
  T? data;
  String? message;
  String? warning;

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      ApiResponseModel(
        status: json["code"],
        message: json["message"] ?? "",
        data: json["data"] ?? "",
        errors: json["errors"] ?? "",
        warning: json["warning"] ?? "",
      );
}
