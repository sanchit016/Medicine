part of 'add_med_view.dart';

class TopBar extends ViewModelWidget<AddMedViewModel> {
  const TopBar({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => {viewModel.navigationService.popRepeated(1)},
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: context.colorScheme.appText,
          ),
        ),
        10.wGap,
        Column(
          children: [
            AppText(
              text: "Add Medicines",
              color: context.colorScheme.appText,
              fontWeight: FontWeight.w500,
              fontSize: 20.hWise,
            ),
          ],
        ),
      ],
    );
  }
}

class Name extends ViewModelWidget<AddMedViewModel> {
  const Name({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return TextField(
      maxLines: 1,
      scrollPhysics: ClampingScrollPhysics(),
      controller: viewModel.nameController,
      decoration: InputDecoration(
        hintText: 'Medicine Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            width: 1.5,
            color: context.colorScheme.appGrey.withOpacity(0.2),
          ),
        ),
        hintStyle: TextStyle(fontSize: 14.hWise),
      ),
    );
  }
}

class Compartment extends ViewModelWidget<AddMedViewModel> {
  const Compartment({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        AppText(
          text: "Compartment",
          color: context.colorScheme.appText,
          fontWeight: FontWeight.w500,
          fontSize: 16.hWise,
        ).alignTL,
        Container(
          height: 75.hWise,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.3,
            ),
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              int curr = index + 1;
              return GestureDetector(
                onTap: () => {
                  viewModel.selectCompartment(curr),
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10.hWise, 10.wWise, 10.hWise),
                  decoration: BoxDecoration(
                      color: viewModel.selectedCompartment == curr
                          ? context.colorScheme.appBlue.withOpacity(0.2)
                          : context.colorScheme.appGrey.withOpacity(0),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.5,
                        color: viewModel.selectedCompartment == curr
                            ? context.colorScheme.appBlue
                            : context.colorScheme.appGrey.withOpacity(0.2),
                      )),
                  child: Center(
                    child: AppText(
                      text: curr.toString(),
                      fontSize: 20.hWise,
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.appText,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Color extends ViewModelWidget<AddMedViewModel> {
  const Color({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        AppText(
          text: "Colour",
          color: context.colorScheme.appText,
          fontWeight: FontWeight.w500,
          fontSize: 16.hWise,
        ).alignTL,
        Container(
          height: 75.hWise,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1.3,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  viewModel.selectColor(index),
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10.hWise, 10.wWise, 10.hWise),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colors[index],
                    border: Border.all(
                      width: 2,
                      color: viewModel.selectedColor == index
                          ? context.colorScheme.appBlue
                          : context.colorScheme.appGrey.withOpacity(0.2),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Type extends ViewModelWidget<AddMedViewModel> {
  const Type({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        AppText(
          text: "Type",
          color: context.colorScheme.appText,
          fontWeight: FontWeight.w500,
          fontSize: 16.hWise,
        ).alignTL,
        Container(
          height: 120.hWise,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  viewModel.selectType(type[index]),
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10.hWise, 10.wWise, 10.hWise),
                  decoration: BoxDecoration(
                    color: colors[viewModel.selectedColor],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1.5,
                      color: viewModel.selectedType == type[index]
                          ? context.colorScheme.appBlue
                          : context.colorScheme.appGrey.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Spacer(),
                      Center(
                        child: Image.asset(
                          "assets/img/${type[index]}.png",
                          height: 60.hWise,
                        ),
                      ),
                      const Spacer(),
                      AppText(
                        text: type[index],
                        fontSize: 12.hWise,
                        fontWeight: FontWeight.w400,
                        color: context.colorScheme.appText,
                      ),
                      3.hGap,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Quantity extends ViewModelWidget<AddMedViewModel> {
  const Quantity({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        AppText(
          text: "Quantity",
          color: context.colorScheme.appText,
          fontWeight: FontWeight.w500,
          fontSize: 16.hWise,
        ).alignTL,
        5.hGap,
        Container(
          height: 45.hWise,
          width: context.w,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.5,
                        color: context.colorScheme.appGrey.withOpacity(0.2),
                      )),
                  child: Center(
                    child: AppText(
                      text: 'Take ' + viewModel.getQuantity() + ' Pill',
                      fontSize: 14.hWise,
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.appText,
                    ),
                  ),
                ),
              ),
              3.wGap,
              GestureDetector(
                onTap: () => {
                  if (viewModel.quantity > 0) ...[
                    viewModel.quantity -= 0.5,
                    viewModel.notifyListeners(),
                  ],
                },
                child: Container(
                  height: 40.hWise,
                  width: 40.hWise,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1.5,
                      color: context.colorScheme.appBlue,
                    ),
                  ),
                  child: Icon(
                    Icons.remove,
                    color: context.colorScheme.appBlue,
                  ),
                ),
              ),
              5.wGap,
              GestureDetector(
                onTap: () => {
                  viewModel.quantity += 0.5,
                  viewModel.notifyListeners(),
                },
                child: Container(
                  height: 40.hWise,
                  width: 40.hWise,
                  decoration: BoxDecoration(
                    color: context.colorScheme.appBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TotalCount extends ViewModelWidget<AddMedViewModel> {
  const TotalCount({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        Row(
          children: [
            AppText(
              text: "Total Count",
              color: context.colorScheme.appText,
              fontWeight: FontWeight.w500,
              fontSize: 16.hWise,
            ).alignTL,
            const Spacer(),
            Container(
              width: 50.wWise,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: context.colorScheme.appGrey.withOpacity(0.2),
              ),
              padding: EdgeInsets.all(5),
              child: Center(
                child: AppText(
                  text: viewModel.total.toInt().toString(),
                  color: context.colorScheme.appText,
                ),
              ),
            ).alignTR,
          ],
        ),
        5.hGap,
        Slider(
          value: viewModel.total,
          onChanged: (newValue) {
            viewModel.total = newValue;
            viewModel.notifyListeners();
          },
          activeColor: context.colorScheme.appBlue,
          inactiveColor: context.colorScheme.appGrey.withOpacity(0.2),
          min: 1,
          max: 100,
          divisions: 100,
        ),
        Row(
          children: [
            AppText(
              text: "01",
              color: context.colorScheme.appText,
              fontWeight: FontWeight.w500,
              fontSize: 12.hWise,
            ).alignTL,
            const Spacer(),
            AppText(
              text: "100",
              color: context.colorScheme.appText,
              fontWeight: FontWeight.w500,
              fontSize: 12.hWise,
            ).alignTR,
          ],
        ),
      ],
    );
  }
}

class SetDate extends ViewModelWidget<AddMedViewModel> {
  const SetDate({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        AppText(
          text: "Set Date",
          color: context.colorScheme.appText,
          fontWeight: FontWeight.w500,
          fontSize: 16.hWise,
        ).alignTL,
        5.hGap,
        Container(
          height: 45.hWise,
          width: context.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => {viewModel.selectStartDate(context)},
                child: Container(
                  width: context.w / 2 - 30.wWise,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.5,
                        color: context.colorScheme.appGrey.withOpacity(0.2),
                      )),
                  child: Center(
                    child: AppText(
                      text: viewModel.start.isNotNull
                          ? viewModel.getDate(viewModel.start!)
                          : 'Start Date',
                      fontSize: 14.hWise,
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.appText,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => {viewModel.selectEndDate(context)},
                child: Container(
                  width: context.w / 2 - 30.wWise,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1.5,
                        color: context.colorScheme.appGrey.withOpacity(0.2),
                      )),
                  child: Center(
                    child: AppText(
                      text: viewModel.end.isNotNull
                          ? viewModel.getDate(viewModel.end!)
                          : 'End Date',
                      fontSize: 14.hWise,
                      fontWeight: FontWeight.w500,
                      color: context.colorScheme.appText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Frequency extends ViewModelWidget<AddMedViewModel> {
  const Frequency({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        AppText(
          text: "Frequency of Days",
          color: context.colorScheme.appText,
          fontWeight: FontWeight.w500,
          fontSize: 16.hWise,
        ).alignTL,
        5.hGap,
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            items: frequency
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14.hWise,
                          color: context.colorScheme.appText,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: viewModel.selectedFrequency,
            onChanged: viewModel.selectFrequency,
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: context.w,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                color: context.colorScheme.appBgLight,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.5,
                  color: context.colorScheme.appGrey.withOpacity(0.2),
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: context.w,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class Times extends ViewModelWidget<AddMedViewModel> {
  const Times({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        AppText(
          text: "How Many Times a Day",
          color: context.colorScheme.appText,
          fontWeight: FontWeight.w500,
          fontSize: 16.hWise,
        ).alignTL,
        5.hGap,
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            items: times
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 14.hWise,
                          color: context.colorScheme.appText,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: viewModel.selectedTimes,
            onChanged: viewModel.selectTimes,
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: context.w,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                color: context.colorScheme.appBgLight,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1.5,
                  color: context.colorScheme.appGrey.withOpacity(0.2),
                ),
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: context.w,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
      ],
    );
  }
}

class Option extends ViewModelWidget<AddMedViewModel> {
  const Option({super.key, reactive = true});
  @override
  Widget build(BuildContext context, AddMedViewModel viewModel) {
    return Column(
      children: [
        Container(
          height: 55.hWise,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 0.45,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => {
                  viewModel.selectOption(options[index]),
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 10.hWise, 10.wWise, 10.hWise),
                  decoration: BoxDecoration(
                    color: viewModel.selectedOption == options[index]
                        ? context.colorScheme.appBlue.withOpacity(0.7)
                        : context.colorScheme.appBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1.5,
                      color: viewModel.selectedCompartment == options[index]
                          ? context.colorScheme.appBlue
                          : context.colorScheme.appGrey.withOpacity(0.2),
                    ),
                  ),
                  child: Center(
                    child: AppText(
                      text: options[index],
                      fontSize: 12.hWise,
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.appText,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
