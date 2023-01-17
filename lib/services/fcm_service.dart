/*
class FCMService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static Future<void> init() async {
    /// Firebase Initialize, Firebase Crashlytics
    await Firebase.initializeApp();

    /// Notification
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description: 'This channel is used for important notifications.',
      // description
      importance: Importance.max,
    );
    var initAndroidSetting =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    var initIosSetting = const IOSInitializationSettings();
    var initSetting = InitializationSettings(
        android: initAndroidSetting, iOS: initIosSetting);
    await FlutterLocalNotificationsPlugin()
        .initialize(initSetting, onSelectNotification: _handleMessageLocal);
    await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static initNotification() async {
    await Firebase.initializeApp();

    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    _firebaseMessaging.getToken().then((String? token) {
      assert(token != null);
      DBService.to.setFirebaseToken(token.toString());
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String title = message.notification!.title.toString();
      String body = message.notification!.body.toString();
      LogService.i(title);
      LogService.i(body);
      Utils.showLocalNotification(title, body);
    });

    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessageTerminated(initialMessage);
    }

    // Background unterminated
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  static void _handleMessageLocal(String? message) {}

  static void _handleMessage(RemoteMessage message) async {}

  static void _handleMessageTerminated(RemoteMessage message) {}
}
*/
