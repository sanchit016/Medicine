part of 'home_view.dart';

class Calender extends ViewModelWidget<HomeViewModel> {
  const Calender({super.key, reactive = true});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: AppText(
                      text: days[(viewModel.currday + 5) % 7],
                      fontSize: 18.hWise,
                      color: context.colorScheme.appGrey,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  5.wGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: AppText(
                      text: days[(viewModel.currday + 6) % 7],
                      fontSize: 18.hWise,
                      color: context.colorScheme.appGrey,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.chevron_left,
            ),
            onPressed: () {
              viewModel.currday--;
              viewModel.today =
                  viewModel.today.subtract(const Duration(days: 1));
              viewModel.notifyListeners();
            },
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.colorScheme.appText.withOpacity(0.8)),
            child: AppText(
              text:
                  '${days[viewModel.currday % 7]}, ${months[viewModel.today.month - 1]} ${viewModel.today.day}',
              color: context.colorScheme.appBg,
              fontSize: 18.hWise,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.chevron_right,
            ),
            onPressed: () {
              viewModel.currday++;
              viewModel.today = viewModel.today.add(const Duration(days: 1));
              viewModel.notifyListeners();
            },
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: AppText(
                      text: days[(viewModel.currday + 1) % 7],
                      fontSize: 18.hWise,
                      color: context.colorScheme.appGrey,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  5.wGap,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: AppText(
                      text: days[(viewModel.currday + 2) % 7],
                      fontSize: 18.hWise,
                      color: context.colorScheme.appGrey,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MedicineCard extends ViewModelWidget<HomeViewModel> {
  final MedicineModel data;
  const MedicineCard({super.key, required this.data, reactive = true});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(20),
      width: context.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.colorScheme.appBlue.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 60.hWise,
            width: 60.wWise,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.hWise),
              color: colors[data.mColor!],
            ),
            child: Image.asset(
              "assets/img/${data.mType}.png",
              height: 20.hWise,
              width: 20.wWise,
            ),
          ),
          20.wGap,
          Container(
              width: 150.wWise,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: data.mName.isNullOrEmpty
                        ? "Medicine Name"
                        : data.mName!,
                    color: Colors.black,
                    fontSize: 20.hWise,
                    fontWeight: FontWeight.w500,
                  ),
                  5.hGap,
                  AppText(
                    text: (data.mType!.isNullOrEmpty ? "" : data.mType!) +
                        ' | ' +
                        (data.mOptions!.isNullOrEmpty ? "" : data.mOptions!),
                    color: Colors.black,
                    fontSize: 15.hWise,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )),
          const Spacer(),
          Icon(
            Icons.add_alert_sharp,
            color: colors[data.mColor!],
            size: 45.hWise,
          ),
        ],
      ),
    );
  }
}
