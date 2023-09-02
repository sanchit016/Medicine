part of 'bottom_nav_view.dart';

class BottomNavViewModel extends BaseViewModel {
  int page;
  BottomNavViewModel({required this.page});
  final log = getLogger("BottomNavViewModel");
  int currentIndex = 0;
  final navigationService = NavigationService();
  final localStorageService = LocalStorageService();

  setIndex(int x) async {
    vibrate();
    currentIndex = x;
    notifyListeners();
  }

  init() {
    currentIndex = page;
    TopLevelFunctions.addListnerToCurrentPage(() {
      if (TopLevelFunctions.getCurrentPage != currentIndex) {
        setIndex(TopLevelFunctions.getCurrentPage);
      }
    });
    notifyListeners();
  }

  vibrate() async {
    bool? checkVib = await Vibration.hasCustomVibrationsSupport();
    if (checkVib.isNotNull && checkVib!) {
      Vibration.vibrate(duration: 20);
    }
  }

  Future<bool> onPressedBack(BuildContext context) async {
    if (currentIndex != 0) {
      setIndex(0);
      return false;
    }
    vibrate();
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.hGap,
                  Image.asset(
                    "assets/img/app_logo.png",
                    height: 70.hWise,
                  ),
                  30.hGap,
                  AppText(
                    text: "Are you sure?",
                    fontSize: 25.hWise,
                    color: context.colorScheme.appText,
                    fontWeight: FontWeight.w600,
                  ),
                  10.hGap,
                  AppText(
                    text: "Want to hold your emotional journey on a one click!",
                    fontSize: 16.hWise,
                    color: context.colorScheme.appText,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  40.hGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            {vibrate(), Navigator.of(context).pop(false)},
                        child: Container(
                          height: 50.hWise,
                          width: 120.hWise,
                          decoration: BoxDecoration(
                              color: context.colorScheme.appGreen,
                              borderRadius: BorderRadius.circular(30.hWise)),
                          child: AppText(
                            text: "Cancel",
                            fontSize: 18.hWise,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ).alignC,
                        ),
                      ),
                      20.wGap,
                      GestureDetector(
                        onTap: () =>
                            {vibrate(), Navigator.of(context).pop(true)},
                        child: Container(
                          height: 50.hWise,
                          width: 120.hWise,
                          decoration: BoxDecoration(
                              color:
                                  context.colorScheme.appGrey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30.hWise)),
                          child: AppText(
                            text: "Confirm",
                            fontSize: 18.hWise,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ).alignC,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )) ??
        false;
  }

  Widget getViewForCurrentIndex(int index) {
    TopLevelFunctions.updateBottomNav(index);
    vibrate();
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        {
          TopLevelFunctions.logoutUser();
          return const HomeView();
        }
      default:
        return const HomeView();
    }
  }

  void onPressedAdd() {
    navigationService.navigateTo(Routes.addMedView);
  }
}
