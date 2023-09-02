part of 'splash_view.dart';

class SplashViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final localStorageService = locator<LocalStorageService>();
  final log = getLogger("SplashViewModel");
  bool showGetStarted = false;

  init() async {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setBusy(true);
        log.i(localStorageService.read("uid"));
        if (localStorageService.read("uid") == null) {
          showGetStarted = true;
          notifyListeners();
          navigationService.navigateTo(Routes.authenticationView);
          log.i("Navigate to Auth");
          setBusy(false);
        } else {
          navigationService.clearStackAndShow(Routes.bottomNavView,
              arguments: const BottomNavViewArguments(page: 0));
          setBusy(false);
        }
      },
    );
  }
}
