import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:vigorus/file_exporter.dart';
import 'package:vigorus/models/medicine_model.dart';
import 'package:vigorus/services/firestore.dart';
import 'package:vigorus/utils/constants.dart';
import 'package:vigorus/utils/constants.dart';
part 'add_med_components.dart';
part 'add_med_model.dart';

class AddMedView extends StatelessWidget {
  const AddMedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddMedViewModel>.nonReactive(
      viewModelBuilder: () => AddMedViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TopBar(),
                  20.hGap,
                  Name(),
                  10.hGap,
                  Compartment(),
                  5.hGap,
                  Color(),
                  5.hGap,
                  Type(),
                  5.hGap,
                  Quantity(),
                  20.hGap,
                  TotalCount(),
                  20.hGap,
                  SetDate(),
                  20.hGap,
                  Frequency(),
                  20.hGap,
                  Times(),
                  20.hGap,
                  Option(),
                  10.hGap,
                  Button(
                      text: "Add",
                      color: context.colorScheme.appBlue,
                      onPressed: model.onPressedAdd,
                      textColor: Colors.white)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
