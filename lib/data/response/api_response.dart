import 'package:pocketquran/data/response/api_status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? msg;

  ApiResponse(
    this.status,
    this.data,
    this.msg,
  );

  ApiResponse.loading() : status = Status.loading;
  ApiResponse.completed(this.data) : status = Status.completed;
  ApiResponse.error(this.msg) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message: $msg \n Data : $data";
  }
}
