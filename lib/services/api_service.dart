import 'package:get/get.dart';
import 'package:kpi_ndqxai/services/log_service.dart';


class ApiService {
  //static const String HTTPS_GET_FILE = 'https://kidboxserver.s3.amazonaws.com/';
  static const String API_AUTH = '/api/v1/mobile/auth';
  static const String CODE_VERIFICATION = '/api/v1/mobile/auth/verifyCode';

  // for task resource APIs

  //static const String GET_ALL_TASKS = '/api/tasks?page=0&size=20'; // PAGINATION
  static const String GET_ALL_TASKS = '/api/tasks/'; // WITHOUT PAGINATION
  static const String GET_ALL_EMPLOYEES = '/api/employees'; // WITHOUT PAGINATION




  /// /* Params */

  static Map<String, dynamic> paramsAuthorization(
      String hemisId, String password) {
    Map<String, dynamic> params = {};
    params.addAll({'username': hemisId, 'password': password});
    return params;
  }

  // for pagination
  static Map<String, dynamic> paramsPagination(int pageNumber,
      {bool all = false}) {
    Map<String, dynamic> params = {};
    params.addAll({"page": pageNumber, "all": all});
    return params;
  }

  static Map<String, dynamic> paramsAuth(String phoneNumber) {
    Map<String, dynamic> params = {};
    String language = Get.locale.toString();
    int id = language == 'ru_RU'
        ? 3
        : language == "uz_UZ"
            ? 1
            : 2;
    params.addAll({
      'language': {"id": id},
      'phoneNumber': phoneNumber,
    });
    return params;
  }

  static Map<String, dynamic> paramsVerifyCode(
    String phoneNumber,
    String otp,
    Map<String, String> deviceInfo,
  ) {
    Map<String, dynamic> params = {};
    params.addAll({
      'deviceDto': deviceInfo,
      'otp': otp,
      'phoneNumber': phoneNumber,
    });
    LogService.i(deviceInfo.toString());
    return params;
  }

  static Map<String, dynamic> paramsVerifyEditAccount(String otp) {
    Map<String, dynamic> params = {};
    params.addAll({"code": otp});
    return params;
  }

  static Map<String, dynamic> paramsCreateParent(
      String? attachmentId,
      String childBirthDate,
      String childName,
      String city,
      String district,
      String fullName,
      String gender,
      String kindergartenName,
      String phoneNumber) {
    Map<String, dynamic> params = {};
    params.addAll({
      "attachmentId": attachmentId,
      "childBirthDate": childBirthDate,
      "childName": childName,
      "city": city,
      "district": district,
      "fullName": fullName,
      "gender": gender,
      "kindergartenId": kindergartenName,
      "phoneNumber": phoneNumber
    });
    LogService.w(params.toString());
    return params;
  }

  static Map<String, dynamic> paramsEmpty() {
    Map<String, dynamic> params = {};
    return params;
  }

  static Map<String, dynamic> paramsComplaint({
    String? attachmentId,
    required String childId,
    required String description,
  }) {
    Map<String, dynamic> params = {};
    params.addAll({
      "attachmentId": [attachmentId],
      "child": childId,
      "description": description,
    });
    return params;
  }

  static Map<String, dynamic> paramsMedicalRequest({
    required String childId,
    required String name,
    required String description,
    required String symptom,
    required String startDate,
    required String endDate,
    required int frequency,
  }) {
    Map<String, dynamic> params = {};
    params.addAll({
      "childId": childId,
      "name": name,
      "description": description,
      "symptom": symptom,
      "startDate": startDate,
      "endDate": endDate,
      "frequency": frequency,
    });
    return params;
  }
}
