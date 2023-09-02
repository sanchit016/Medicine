part of 'authentication_view.dart';

class AuthenticationViewModel extends BaseViewModel {
  final log = getLogger('AuthenticationViewModel');
  final navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();
  final screenLoader = ScreenLoader();
  TextEditingController emailTextFieldController = TextEditingController();
  TextEditingController passwordTextFieldController = TextEditingController();
  bool obscurePassword = true;
  bool emailError = false;
  bool passwordError = false;
  String emailErrorString = "";
  String passwordErrorString = "";
  bool showSignUp = false;

  init() {}

  vibrate() async {
    bool? checkVib = await Vibration.hasCustomVibrationsSupport();
    if (checkVib.isNotNull && checkVib!) {
      Vibration.vibrate(duration: 20);
    }
  }

  void onPressedSignUp() async {
    showSignUp = !showSignUp;
    notifyListeners();
  }

  void onPressedTerms() async {
    Uri url =
        Uri.parse('https://www.linkedin.com/in/sanchit-chhabra-134160213/');
    await launchUrl(url);
  }

  void onPressedPrivacyPolicy() async {
    Uri url =
        Uri.parse('https://www.linkedin.com/in/sanchit-chhabra-134160213/');
    await launchUrl(url);
  }

  void onPressedSigninWithEmail() async {
    await signInWithEmailAndPassword();
    vibrate();
  }

  void onPressedSignInWithGoogle() async {
    screenLoader.startLoader();
    vibrate();
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential.user.isNotNull &&
        userCredential.user!.email!.isNotNull) {
      log.i(userCredential.user!.email!);
      log.i(userCredential.user!.uid);
      Signup(userCredential.user!.email!, userCredential.user!.uid);
      navigationService.clearStackAndShow(Routes.bottomNavView,
          arguments: const BottomNavViewArguments(page: 0));
    }
    screenLoader.stopLoader();
  }

  Future<void> Signup(String email, String uid) async {
    _localStorageService.write("uid", uid);
    _localStorageService.write("fullName", email.split('@')[0]);
    _localStorageService.write("email", email);
    String resp = await FireStoreMethods().addUser(uid);
    log.i(resp);
  }

  onPressedLogout() {
    TopLevelFunctions.logoutUser();
  }

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword() async {
    setBusy(true);
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final String email = emailTextFieldController.text.trim();
    final String password = passwordTextFieldController.text;
    try {
      emailError = false;
      passwordError = false;

      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (userCredential.user.isNotNull &&
            userCredential.user!.email!.isNotNull) {
          log.i(userCredential.user!.email!);
          log.i(userCredential.user!.uid);
          Signup(userCredential.user!.email!, userCredential.user!.uid);
          navigationService.clearStackAndShow(Routes.bottomNavView,
              arguments: const BottomNavViewArguments(page: 0));
        }

        print('Sign-in successful');
      } else if (email.isNullOrEmpty) {
        emailError = true;
        emailErrorString = "Enter Email";
      } else {
        passwordError = true;
        passwordErrorString = "Enter Password";
      }
    } catch (e) {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user.isNotNull &&
            userCredential.user!.email!.isNotNull) {
          log.i(userCredential.user!.email!);
          log.i(userCredential.user!.uid);
          Signup(userCredential.user!.email!, userCredential.user!.uid);
          navigationService.clearStackAndShow(Routes.bottomNavView,
              arguments: const BottomNavViewArguments(page: 0));
        }

        print('Sign-in successful');
      } catch (e) {
        passwordError = true;
        emailError = true;
        emailErrorString = "";
        passwordErrorString = e.toString();
      }
    }

    setBusy(false);
  }
}
