import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:vigorus/file_exporter.dart';
import 'package:vigorus/firebase_options.dart';
import 'package:vigorus/themes/theme_service.dart';



Future<void> main() async {
  final log = getLogger("Main.dart");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final fcmToken = await messaging.getToken();
  log.i(fcmToken);
  await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true,
    carPlay: true,
    criticalAlert: true,
    provisional: true,
    sound: true,
  );
  await Future.wait([
    GetStorage.init(),
  ]);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final themeService = locator<ThemeService>();
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeService.brightnessListner,
      builder: ((context, value, child) {
        return MaterialApp(
          title: "Vigorus",
          theme: ThemeData(
              scaffoldBackgroundColor: context.colorScheme.appBgLight,
              fontFamily: 'Outfit',
              brightness: Brightness.light),
          darkTheme: ThemeData(
            scaffoldBackgroundColor: context.colorScheme.appBgDark,
            fontFamily: 'Outfit',
            brightness: Brightness.dark,
          ),
          themeMode: themeService.brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
          initialRoute: Routes.splashView,
        );
      }),
    );
  }
}
