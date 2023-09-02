import 'package:vigorus/file_exporter.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get appBgDark => const Color(0xFF141414);
  Color get appBgLight => const Color(0xFFFFFFFF);

  Color get appBg => brightness == Brightness.dark
      ? const Color(0xFF000000)
      : const Color(0xFFF2F2F2);
  Color get appText => brightness == Brightness.dark
      ? const Color(0xFFF2F2F2)
      : const Color(0xFF000000);

  Color get selectedNav => brightness == Brightness.dark
      ? const Color(0xFFB0C929)
      : const Color(0xFF000000);

  Color get cellColor => brightness == Brightness.dark
      ? const Color(0xFF000000)
      : const Color(0xFFFFFFFF);

  Color get newCellColor => brightness == Brightness.dark
      ? const Color(0xFF000000)
      : const Color(0xFFEBEBEB);

  Color get appGreen => const Color.fromARGB(255, 116, 207, 197);
  Color get appBlue => const Color.fromARGB(255, 117, 138, 232);
  Color get signInwithGoogleBg => const Color(0xFFFFFFFF);

  Color get signInwithGoogleText => const Color(0xFF000000).withOpacity(0.54);

  Color get signInwithAppleBg => brightness == Brightness.dark
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF000000);

  Color get signInwithAppleText => brightness == Brightness.dark
      ? const Color(0xFF000000)
      : const Color(0xFFFFFFFF);

  Color get appbarBg => brightness == Brightness.dark
      ? const Color(0xFF000000)
      : const Color(0xFFFFFFFF);

  Color get appbarIcons => brightness == Brightness.dark
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF686993);

  Color get appbarTitle => brightness == Brightness.dark
      ? const Color(0xFF000000)
      : const Color(0xFFFFFFFF);

  Color get appGrey => const Color(0xFF8A8A8A);

  Color get selectedBottomNavIcon => const Color(0xFF000000);

  Color get selectedBottomNavIconbg => brightness == Brightness.dark
      ? const Color(0xFF000000).withOpacity(0.3)
      : const Color(0xFF000000).withOpacity(0.1);

  Color get unSelectedBottomNavIcon => brightness == Brightness.dark
      ? const Color(0xFF9DB2CE).withOpacity(0.8)
      : const Color(0xFF9DB2CE);

  Color get bottomNavBarBg => brightness == Brightness.dark
      ? const Color(0xFF000000)
      : const Color(0xFFFFFFFF);

  Color get cardText => brightness == Brightness.dark
      ? const Color(0xFF212525).withOpacity(0.7)
      : const Color(0xFF212525).withOpacity(0.7);
}
