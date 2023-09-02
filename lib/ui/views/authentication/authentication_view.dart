import 'package:google_sign_in/google_sign_in.dart';
import 'package:vigorus/file_exporter.dart';
import 'package:vigorus/services/firestore.dart';

part 'authentication_view_model.dart';
part 'authentication_view_components.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
      viewModelBuilder: () => AuthenticationViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.all(20.hWise),
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/img/adhicine.png",
                  width: 150.wWise,
                ),
                50.hGap,
                AppText(
                  text: model.showSignUp ? "SignUp" : "Sign In",
                  color: context.colorScheme.appText,
                  fontSize: 40.hWise,
                  fontWeight: FontWeight.w500,
                ).alignTL,
                30.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.alternate_email_outlined,
                      color: model.emailError
                          ? Colors.red
                          : context.colorScheme.appGreen,
                    ),
                    20.wGap,
                    SizedBox(
                      width: context.w - 120.wWise,
                      child: TextField(
                        maxLines: 1,
                        scrollPhysics: const ClampingScrollPhysics(),
                        controller: model.emailTextFieldController,
                        decoration: InputDecoration(
                          hintText: 'Email address',
                          hintStyle: TextStyle(
                            fontSize: 20.hWise,
                            color: context.colorScheme.appGrey.withOpacity(0.5),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                if (model.emailError) ...[
                  AppText(
                    text: model.passwordErrorString,
                    color: Colors.red,
                    maxLines: 1,
                  ).alignTL,
                ],
                20.hGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      color: model.passwordError
                          ? Colors.red
                          : context.colorScheme.appGreen,
                    ),
                    20.wGap,
                    SizedBox(
                      width: context.w - 120.wWise,
                      child: TextField(
                        maxLines: 1,
                        scrollPhysics: const ClampingScrollPhysics(),
                        controller: model.passwordTextFieldController,
                        obscureText: model
                            .obscurePassword, // This controls password visibility
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            fontSize: 20.hWise,
                            color: context.colorScheme.appGrey.withOpacity(0.5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              model.obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: model.passwordError
                                  ? Colors.red
                                  : context.colorScheme.appGrey
                                      .withOpacity(0.5),
                            ),
                            onPressed: () {
                              model
                                  .togglePasswordVisibility(); // Function to toggle password visibility
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (model.passwordError) ...[
                  AppText(
                    text: model.passwordErrorString,
                    color: Colors.red,
                    maxLines: 1,
                  ).alignTL,
                ],
                50.hGap,
                if (!model.isBusy) ...[
                  SignInButton(
                    text: "Sign in",
                    bgColor: context.colorScheme.appBlue,
                    onPressed: model.onPressedSigninWithEmail,
                    textColor: Colors.white,
                  ),
                ] else ...[
                  CircularProgressIndicator(),
                ],
                30.hGap,
                Row(
                  children: [
                    15.wGap,
                    const Expanded(
                      child: Divider(color: Color(0xFF9090A0)),
                    ),
                    AppText(
                      text: "  OR  ",
                      color: context.colorScheme.appGrey,
                      fontSize: 12.hWise,
                    ),
                    const Expanded(
                      child: Divider(color: Color(0xFF9090A0)),
                    ),
                    15.wGap,
                  ],
                ),
                30.hGap,
                SignInButton(
                  text: "Continue with Google",
                  onPressed: model.onPressedSignInWithGoogle,
                  imagePath: 'assets/img/google_g_logo.png',
                  bgColor: context.colorScheme.signInwithGoogleBg,
                  textColor: context.colorScheme.signInwithGoogleText,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Adhicine? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.colorScheme.appText,
                        fontFamily: 'Outfit',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                    const Signup(),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'By using our mobile app, you agree to our',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.colorScheme.appText,
                        fontFamily: 'Outfit',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                    const Terms(),
                    Text(
                      ' & ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: context.colorScheme.appText,
                        fontFamily: 'Outfit',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        height: 1,
                      ),
                    ),
                    const PrivacyPolicy(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
