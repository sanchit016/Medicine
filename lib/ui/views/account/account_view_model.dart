part of 'account_view.dart';

class AccountViewModel extends BaseViewModel {
  String fullName = "";
  String email = "";
  String? dropdownValue = "null";
  String age = "0";
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  int genderIndex = 0;
  static final localStorageService = locator<LocalStorageService>();
  final navigationService = locator<NavigationService>();

  List<String> options = ["male", "female", "other"];

  List<IconData> genderIconData = [
    Icons.male,
    Icons.female,
    Icons.transgender,
  ];

  init() {
    fullName = localStorageService.read("fullName");
    email = localStorageService.read("email");
  }

  void onChangedDropdown(String? value) {
    dropdownValue = value;
    notifyListeners();
  }

  onPressedBack() {
    navigationService.popRepeated(1);
  }

  Map<int, String> idxToGender = {0: "male", 1: "female", 2: "other"};
  Map<String, int> genderToIdx = {"male": 0, "female": 1, "other": 2};

  onPressedSave() {}
}
