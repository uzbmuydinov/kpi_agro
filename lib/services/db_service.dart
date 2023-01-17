import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kpi_ndqxai/models/my_account_info.dart';
import 'package:kpi_ndqxai/pages/manage_page_googleNavbar_controller.dart';
import 'lang_service.dart';

class DBService {
  final GetStorage _box = GetStorage();

  static DBService get to => Get.find<DBService>();

  static Future<void> init() async {
    await Get.putAsync<DBService>(() async {
      final storageService = DBService();
      await GetStorage.init();
      return storageService;
    }, permanent: true);
  }

  bool isLoggedIn() {
    String token = getAccessToken();
    return token.isNotEmpty;
  }

  Future<void> logOut() async {
    final ctrl = Get.find<ManagePageGoogleNavbarController>();
    ctrl.update();
    await delAccessToken();

  }

  // Firebase Token
  Future<void> setFirebaseToken(String value) async {
    await _box.write(_StorageKeys.FIREBASE_TOKEN, value);
  }

  String getFirebaseToken() {
    return _box.read(_StorageKeys.FIREBASE_TOKEN);
  }

  Future<void> delFirebaseToken() async {
    await _box.remove(_StorageKeys.FIREBASE_TOKEN);
  }

  // Access Token
  Future<void>
  setAccessToken(String value) async {
    await _box.write(_StorageKeys.ACCESS_TOKEN, value);
  }

  String getAccessToken() {
    return _box.read(_StorageKeys.ACCESS_TOKEN) ?? "";
  }

  Future<void> delAccessToken() async {
    await _box.remove(_StorageKeys.ACCESS_TOKEN);
  }

  MyAccountInfo getMyAccoountInfo() {
    final map = _box.read(_StorageKeys.MY_INFO);
    if (map == null) return MyAccountInfo();

    return MyAccountInfo.fromJson(map);
  }
  Future<void> delParentHome() async {
    await _box.remove(_StorageKeys.PARENT_HOME);
  }

  // User


  Future<void> delUser() async {
    await _box.remove(_StorageKeys.MY_INFO);
  }

  // Language
  String getLanguage() {
    var lang = _box.read(_StorageKeys.LANGUAGE);
    if (lang == null || lang.isEmpty) return LangService.langs[0];
    return lang;
  }

  Future<void> setLanguage(String code) async {
    await _box.write(_StorageKeys.LANGUAGE, code);
  }

  // Device ID
  String getDeviceId() {
    var id = _box.read(_StorageKeys.DEVICE_ID);
    if (id == null || id.isEmpty) return "";
    return id;
  }

  Future<void> setDeviceId(String id) async {
    await _box.write(_StorageKeys.DEVICE_ID, id);
  }

  Future<void> delDeviceId() async {
    await _box.remove(_StorageKeys.DEVICE_ID);
  }
}

class _StorageKeys {
  static const  ACCESS_TOKEN = 'access_token';
  static const FIREBASE_TOKEN = 'firebase_token';
  static const LANGUAGE = 'language';
  static const MY_INFO = 'user';

  static const PARENT_HOME = 'parent_home';
  static const DEVICE_ID = 'device_id';
}
