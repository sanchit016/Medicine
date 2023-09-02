import 'package:google_sign_in/google_sign_in.dart';
import 'package:vigorus/file_exporter.dart';
import 'package:vigorus/services/local_storage_services.dart';
import 'package:vigorus/themes/theme_service.dart';

class TopLevelFunctions {
  static final log = getLogger('TopLevelFunctions');
  static final navigationService = locator<NavigationService>();
  static final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
  static void addListnerToCurrentPage(VoidCallback listner) =>
      _currentPage.addListener(listner);
  static void updateBottomNav(int page) => _currentPage.value = page;
  static int get getCurrentPage => _currentPage.value;
  static final localStorageService = locator<LocalStorageService>();
  static final themeService = locator<ThemeService>();

  // static Future<void> loginUser()

  static Future<void> logoutUser() async {
    localStorageService.clear();
    themeService.updateTheme(false);
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.isSignedIn().then(
          (value) async => {
            log.i("Pressed logout"),
            if (value) await googleSignIn.signOut(),
            await Future.delayed(const Duration(milliseconds: 100)),
            navigationService.clearStackAndShow(Routes.splashView),
          },
        );
  }

  String changeTheme(String mode) {
    localStorageService.write("theme", mode);
    return mode;
  }

  ThemeMode currentTheme(String mode) {
    return localStorageService.read("theme") == "dark"
        ? ThemeMode.dark
        : ThemeMode.light;
  }
}
