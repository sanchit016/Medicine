part of 'home_view.dart';

class HomeViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  static final localStorageService = locator<LocalStorageService>();
  final log = getLogger("HomeViewModel");
  String name = localStorageService.read("fullName");
  int currday = DateTime.now().weekday;
  DateTime today = DateTime.now();
  int count = 0;
  List<MedicineModel> medicines = [];

  vibrate() async {
    bool? checkVib = await Vibration.hasCustomVibrationsSupport();
    if (checkVib.isNotNull && checkVib!) {
      Vibration.vibrate(duration: 20);
    }
  }

  init() async {
    setBusy(true);
    FirebaseNotificationsService().handleForegroundNotification();
    medicines =
        await FireStoreMethods().getMedicine(localStorageService.read("uid"));
    count = medicines.length;
    notifyListeners();
    setBusy(false);
  }

  void onPressedProfile() {
    navigationService.navigateTo(Routes.accountView);
  }
}
