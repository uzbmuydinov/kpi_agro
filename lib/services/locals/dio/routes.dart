class DioRoutePath {
  static bool isTester = false;

  static String get baseUrl {
    if (isTester) return DioRoutePath.serverDevelopment;
    return DioRoutePath.serverProduction;
  }

  static String serverProduction = "https://admin-kpi.andqxai.uz";
  static String serverDevelopment = "https://admin-kpi.andqxai.uz";

  static String postAuthenticate = "/api/authenticate";
  static String getAccount = "/api/account";
  static String getEmployees = '/api/employees';
  static String getAlltasks = '/api/tasks'; // pagination


  //Params
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, dynamic> bodyAuthenticate({required String hemisId,required String password}) {
    Map<String, dynamic> params = {
      "username" : hemisId,
      "password" : password,
    };
    return params;
  }
}
