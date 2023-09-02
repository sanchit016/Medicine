part of 'add_med_view.dart';

class AddMedViewModel extends BaseViewModel {
  final log = getLogger('AddMedicineViewModel');
  final navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();
  TextEditingController nameController = TextEditingController();
  String name = "";
  int selectedCompartment = 1;
  int selectedColor = 0;
  String selectedType = "Capsule";
  double quantity = 1;
  double total = 1;
  DateTime? start;
  DateTime? end;
  String selectedFrequency = frequency.first;
  String selectedTimes = times.first;
  String selectedOption = "";
  init() {}

  selectCompartment(int curr) {
    selectedCompartment = curr;
    notifyListeners();
  }

  selectOption(String curr) {
    selectedOption = curr;
    notifyListeners();
  }

  selectColor(int curr) {
    selectedColor = curr;
    notifyListeners();
  }

  selectType(String curr) {
    selectedType = curr;
    notifyListeners();
  }

  selectStartDate(BuildContext context) async {
    start = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    notifyListeners();
  }

  selectEndDate(BuildContext context) async {
    end = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    notifyListeners();
  }

  String getDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year % 100}';
  }

  String getQuantity() {
    if ((quantity * 2) % 2 == 0) {
      return quantity.toInt().toString();
    } else {
      return '${(quantity * 2).toInt()}/2';
    }
  }

  void selectFrequency(String? value) {
    if (value.isNotNull) {
      selectedFrequency = value!;
    } else {
      selectedFrequency = frequency.first;
    }
    notifyListeners();
  }

  void selectTimes(String? value) {
    if (value.isNotNull) {
      selectedTimes = value!;
    } else {
      selectedTimes = times.first;
    }
    notifyListeners();
  }

  onPressedAdd() async {
    log.i("add");
    name = nameController.text;
    if (end.isNotNull) {
      end = end!.add(Duration(days: 1));
      end = end!.subtract(Duration(minutes: 1));
    }
    MedicineModel medicine = MedicineModel(
      mName: name,
      mColor: selectedColor,
      mCompartment: selectedCompartment,
      mType: selectedType,
      mQuantity: quantity,
      mCount: total,
      mStart: start,
      mEnd: end,
      mFrequency: selectedFrequency,
      mTimes: selectedTimes,
      mOptions: selectedOption,
    );
    String post = await FireStoreMethods()
        .uploadMedicine(medicine, _localStorageService.read('uid'));
    if (post == "success") {
      navigationService.clearStackAndShow(Routes.bottomNavView,
          arguments: BottomNavViewArguments(page: 0));
    } else {
      Fluttertoast.showToast(msg: post);
    }
  }
}
