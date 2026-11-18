import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/core/shared_ui/button.dart';
import 'package:movie_app/core/shared_ui/custom_text_field.dart';
import 'package:movie_app/core/shared_ui/switch_language.dart';
import 'package:movie_app/core/utils/validation.dart';
import 'package:movie_app/l10n/app_localizations.dart';
import 'package:movie_app/ui/auth/forget_password/forget_password_screen.dart';
import 'package:movie_app/ui/auth/register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
    }
  }

  void _loginWithGoogle() {
    FocusScope.of(context).unfocus();
  }

  void _navigateToForgetPassword() {
    Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
  }

  void _navigateToRegister() {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 24,),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24),
                Center(
                  child: Image.asset('assets/app_logo.png', width: 121, height: 118, fit: BoxFit.contain,),
                ),
                SizedBox(height: 56),
                CustomTextField(
                  controller: _emailController,
                  hintText: l10n.email,
                  prefixIcon: Icon(Icons.email_rounded),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) =>
                      Validation.validateEmail(context, value),
                ),
                SizedBox(height: 22),
                CustomTextField(
                  controller: _passwordController,
                  hintText: l10n.password,
                  prefixIcon: Icon(Icons.lock_rounded),
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submitLogin(),
                  validator: (value) =>
                      Validation.validatePassword(context, value),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: _navigateToForgetPassword,
                    child: Text(l10n.forgetPassword),
                  ),
                ),
                SizedBox(height: 16),
                Button(text: l10n.login, onPressed: _submitLogin),
                SizedBox(height: 12),
                _LoginFooterSection(
                  onNavigateToRegister: _navigateToRegister,
                  onLoginWithGoogle: _loginWithGoogle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginFooterSection extends StatelessWidget {
  final VoidCallback onNavigateToRegister;
  final VoidCallback onLoginWithGoogle;

  const _LoginFooterSection({
    required this.onNavigateToRegister,
    required this.onLoginWithGoogle,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                l10n.dontHaveAccount,
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
              ),
            ),
            TextButton(
              onPressed: onNavigateToRegister,
              style: TextButton.styleFrom(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 6),
                minimumSize: Size(48, 48),
              ),
              child: Text(
                l10n.createOne,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(child: Divider(color: theme.colorScheme.primary, thickness: 1),),
              Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 14),
                child: Text(l10n.or, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary, fontSize: 15,),
                ),
              ),
              Expanded(child: Divider(color: theme.colorScheme.primary, thickness: 1),),
            ],
          ),
        ),
        SizedBox(height: 24),
        Button(
          text: l10n.loginWithGoogle,
          leadingIcon: Image.asset('assets/google_icon.png', width: 24, height: 24,),
          onPressed: onLoginWithGoogle,
        ),
        SizedBox(height: 28),
        SwitchLanguage(),
      ],
    );
  }
}
