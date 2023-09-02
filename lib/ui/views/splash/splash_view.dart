import 'package:connectivity/connectivity.dart';
import 'package:vigorus/file_exporter.dart';
part 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.nonReactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -300,
              left: -10,
              child: Container(
                height: 750,
                width: 750,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF0CF0FF),
                      context.colorScheme.appBg.withOpacity(0)
                    ],
                    radius: 0.5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10,
              right: -300,
              child: Container(
                height: 560,
                width: 560,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      const Color(0xFF0C6DFF),
                      context.colorScheme.appBg.withOpacity(0)
                    ],
                    radius: 0.5,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50.hWise),
              child: Column(
                children: [
                  250.hGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Vigorus",
                        color: context.colorScheme.appText,
                        fontSize: 60.hWise,
                        fontWeight: FontWeight.w600,
                      ),
                      AppText(
                        text: ".",
                        fontSize: 60.hWise,
                        color: context.colorScheme.appGreen,
                        fontWeight: FontWeight.w900,
                      ),
                    ],
                  ),
                  50.hGap,
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
