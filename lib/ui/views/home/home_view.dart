import 'package:flutter/rendering.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vigorus/file_exporter.dart';
import 'package:vigorus/models/medicine_model.dart';
import 'package:vigorus/services/firebase_notifications_service.dart';
import 'package:vigorus/services/firestore.dart';
import 'package:vigorus/services/local_storage_services.dart';
import 'package:vigorus/utils/constants.dart';

part 'home_view_components.dart';
part 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onViewModelReady: (viewModel) => viewModel.init(),
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      20.wWise, 30.hWise, 10.wWise, 0.hWise),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: 'Hi ${model.name}!',
                            fontSize: 25.hWise,
                            fontWeight: FontWeight.w500,
                            color: context.colorScheme.appText,
                          ).alignTL,
                          AppText(
                            text: "${model.count} Medicines left",
                            fontSize: 14.hWise,
                            color: context.colorScheme.appText,
                            fontWeight: FontWeight.w500,
                          ).alignTL,
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: model.onPressedProfile,
                        child: Icon(
                          Icons.person,
                          size: 40.hWise,
                          color: context.colorScheme.appBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                10.hGap,
                Calender(),
                if (model.count == 0) ...[
                  50.hGap,
                  Image.asset(
                    "assets/img/noData.png",
                    width: context.w / 2,
                  ),
                ] else ...[
                  for (int i = 0; i < model.medicines.length; i++) ...[
                    if (model.medicines[i].mStart.isNotNull &&
                        model.medicines[i].mEnd.isNotNull) ...[
                      if (model.medicines[i].mStart!.isBefore(model.today) &&
                          model.medicines[i].mEnd!.isAfter(model.today)) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.hWise,
                            horizontal: 10.wWise,
                          ),
                          child: MedicineCard(
                            data: model.medicines[i],
                          ),
                        ),
                      ],
                    ] else ...[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5.hWise,
                          horizontal: 10.wWise,
                        ),
                        child: MedicineCard(
                          data: model.medicines[i],
                        ),
                      ),
                    ]
                  ]
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
