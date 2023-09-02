import 'package:vigorus/file_exporter.dart';
import 'package:vigorus/themes/theme_service.dart';
import 'package:vigorus/ui/views/account/account_view.dart';
import 'package:vigorus/ui/views/add_med/add_med_view.dart';
import 'package:vigorus/ui/views/authentication/authentication_view.dart';
import 'package:vigorus/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:vigorus/ui/views/home/home_view.dart';
import 'package:vigorus/ui/views/splash/splash_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: AuthenticationView),
    MaterialRoute(page: BottomNavView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: AccountView),
    MaterialRoute(page: AddMedView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: LocalStorageService),
    LazySingleton(classType: ThemeService),
  ],
  logger: StackedLogger(),
)
class $AppRouter {}


//flutter pub run build_runner build