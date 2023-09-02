import 'dart:io';
import 'package:vigorus/file_exporter.dart';
import 'package:vigorus/ui/views/home/home_view.dart';
part 'bottom_nav_view_model.dart';

class BottomNavView extends StatelessWidget {
  final int page;
  const BottomNavView({required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
      onViewModelReady: (model) => model.init(),
      viewModelBuilder: () => BottomNavViewModel(page: page),
      builder: (context, model, child) {
        return WillPopScope(
          onWillPop: () => model.onPressedBack(context),
          child: Scaffold(
            extendBody: true,
            body: model.getViewForCurrentIndex(model.currentIndex),
            floatingActionButton: GestureDetector(
              onTap: model.onPressedAdd,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.colorScheme.appText.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: context.colorScheme.appGrey.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  color: context.colorScheme.appBg,
                  size: 30.hWise,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: context.colorScheme.appGrey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              height: 70.hWise,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.wWise),
                  topRight: Radius.circular(15.wWise),
                ),
                child: BottomAppBar(
                  color: context.colorScheme.bottomNavBarBg,
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor:
                        context.colorScheme.bottomNavBarBg.withOpacity(0.1),
                    landscapeLayout:
                        BottomNavigationBarLandscapeLayout.centered,
                    type: BottomNavigationBarType.fixed,
                    iconSize: 28.hWise,
                    selectedFontSize: 16.hWise,
                    unselectedFontSize: 15.hWise,
                    currentIndex: model.currentIndex,
                    selectedItemColor: context.colorScheme.appBlue,
                    unselectedItemColor:
                        context.colorScheme.appGrey.withOpacity(0.6),
                    onTap: model.setIndex,
                    items: const [
                      BottomNavigationBarItem(
                        label: 'Home',
                        icon: Icon(Icons.home_filled),
                      ),
                      BottomNavigationBarItem(
                        label: 'Log Out',
                        icon: Icon(Icons.bar_chart),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
