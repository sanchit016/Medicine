part of 'authentication_view.dart';

class SignInButton extends ViewModelWidget<AuthenticationViewModel> {
  final String text;
  final Function() onPressed;
  final String? imagePath;
  final Color textColor, bgColor;
  const SignInButton(
      {required this.text,
      required this.onPressed,
      this.imagePath,
      required this.bgColor,
      required this.textColor,
      super.key});

  @override
  Widget build(BuildContext context, viewModel) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 5.wWise,
          vertical: 10.hWise,
        ),
        height: 50.hWise,
        width: context.w - 50.wWise,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30.hWise),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 3.0,
              spreadRadius: 1.0,
              offset: const Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath.isNotNull) ...[
              Image.asset(
                imagePath!,
                width: 50.wWise,
              ),
            ],
            5.wGap,
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w500,
                fontSize: 20.hWise,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Terms extends ViewModelWidget<AuthenticationViewModel> {
  const Terms({super.key});

  @override
  Widget build(BuildContext context, AuthenticationViewModel viewModel) {
    return InkWell(
      onTap: viewModel.onPressedTerms,
      child: Text(
        'Terms of use',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          height: 1,
          color: context.colorScheme.appBlue,
        ),
      ),
    );
  }
}

class Signup extends ViewModelWidget<AuthenticationViewModel> {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, AuthenticationViewModel viewModel) {
    return InkWell(
      onTap: viewModel.onPressedSignUp,
      child: Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          height: 1,
          color: context.colorScheme.appBlue,
        ),
      ),
    );
  }
}

class PrivacyPolicy extends ViewModelWidget<AuthenticationViewModel> {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, AuthenticationViewModel viewModel) {
    return InkWell(
      onTap: viewModel.onPressedPrivacyPolicy,
      child: Text(
        'Privacy Policy',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          height: 1,
          color: context.colorScheme.appBlue,
        ),
      ),
    );
  }
}
